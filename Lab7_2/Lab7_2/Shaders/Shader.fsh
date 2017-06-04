//
//  Shader.fsh
//  Lab7_2
//
//  Created by Admin on 23.04.17.
//  Copyright (c) 2017 Yury Struchkou. All rights reserved.
//

varying lowp vec4 colorVarying;

void main()
{
    gl_FragColor = colorVarying;
}
