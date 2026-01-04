//
//  HesapModel.swift
//  Hesap
//
//  Created by Engin on 4.01.2026.
//

import Foundation


// [VERGİ SABİT ORANLAR]

enum Vergi: Decimal {
    case kdv = 0.20
    case stopaj = 0.15
    case tevkifat = 0.30
}

// [Tevkifat Yapıları]

struct NoTevkifat {
    let hakedis: Decimal
    
    // Hesaplama
    
    var stopaj: Decimal {
        hakedis * Vergi.stopaj.rawValue
    }
    var brut: Decimal {
        hakedis + stopaj
    }
    var kdv: Decimal {
        brut * Vergi.kdv.rawValue
    }
    var faturaBedeli: Decimal {
        (hakedis + kdv) - stopaj
    }
}

struct WithTevkifat {
    let hakedis: Decimal
    
    //  Hesaplama
    
    var stopaj: Decimal {
        hakedis * Vergi.stopaj.rawValue
    }
    var brut: Decimal {
        hakedis + stopaj
    }
    var kdv: Decimal {
        brut * Vergi.kdv.rawValue
    }
    var tevkifat: Decimal {
        kdv * Vergi.tevkifat.rawValue
    }
        
    var yekun: Decimal {
        (hakedis + kdv) - stopaj
    }
    var faturaBedeli: Decimal {
        yekun - tevkifat
    }
}

