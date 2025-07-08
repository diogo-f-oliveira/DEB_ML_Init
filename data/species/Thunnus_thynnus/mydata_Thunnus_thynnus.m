function [data, auxData, metaData, txtData, weights] = mydata_Thunnus_thynnus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Thunnus_thynnus'; 
metaData.species_en = 'Atlantic bluefin tuna'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'}; 
metaData.data_1     = {'t-Le'; 't-L_f'; 't-Ww'; 'L-Ww'; 't-N'; 'T-ab'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Marko Jusup', 'Bas Kooijman'};    
metaData.date_subm = [2010 02 14];              
metaData.email    = {'mjusup@gmail.com'};            
metaData.address  = {'Kyoto University'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2011 05 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 10 31];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 10 31];


%% set data
% zero-variate data

data.ap = 4 * 365;    units.ap = 'd';    label.ap = 'age at puberty';       bibkey.ap = {'AguaGarc2005','JusuKlan2011'};
  temp.ap = C2K(24);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 27 * 365;   units.am = 'd';    label.am = 'life span';            bibkey.am = {'AguaGarc2005','JusuKlan2011'};   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.4;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = {'MiyaTana2001','JusuKlan2011'};  
data.Lp  = 97;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = {'AguaGarc2005','JusuKlan2011'}; 
data.Li  = 380;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = {'AguaGarc2005','JusuKlan2011'};

% uni-variate data
% t-L data
% larval growth data (d after hatching, total length in mm)
t = [0.0041;1.0045;2.0337;3.0248;3.9964;5.0445;6.0157;7.0258;8.0547;
     9.0834;9.9982;10.9887;12.0558;13.0464;14.0175;14.9888;16.0178;
     16.9891;17.9793;19.0077;20.017;20.9481;22.0704;22.9455;23.9353;
     25.002;25.9846;27.0301;27.9564;29.0392;29.9684];
L = [2.757;3.8844;3.9254;3.9664;4.283;4.4423;5.0346;5.115;5.3924;
    5.7879;5.8682;6.303;6.5016;6.8577;7.5288;8.0818;8.2804;8.7546;
    9.4258;10.0576;10.65;12.5815;14.1587;15.3417;16.2098;16.7235;
    22.5543;24.5253;29.7258;32.2483;35.4794];
L = L * .1; % convert mm to cm
data.tL_lrv = [t, L];
units.tL_lrv   = {'d', 'cm'};  label.tL_lrv = {'time since hatch', 'total length'};  
temp.tL_lrv    = C2K(24);  units.temp.tL_lrv = 'K'; label.temp.tL_lrv = 'temperature';
bibkey.tL_lrv = 'MiyaTana2001';
% late juvenile growth (after metamorphsis?) between 1 month and 1 year;
% time in d, length in fork length (cm)
t = [39.3878;74.3068;77.4754;79.3628;79.748;83.5075;83.557;83.8995;
     84.2201;84.6179;85.6877;86.7229;89.4581;90.5157;90.9639;91.5568;
     92.391;92.6144;94.5028;100.5467;101.6682;103.7872;115.1721;
     120.8209;120.8794;125.0228;126.3696;126.9895;127.1157;127.1301;
     127.3634;128.0336;129.2193;129.2405;130.072;130.1449;134.5217;
     134.5428;134.8537;134.8798;137.0271;137.442;137.4618;137.9717;
     139.5466;139.7835;141.5083;143.5665;143.5723;143.7557;144.6399;
     145.0125;145.5322;146.7215;146.7435;146.9112;147.1494;148.622;
     148.6395;163.5732;165.6647;170.3454;172.663;193.6685;194.9743;
     199.1578;210.1197;249.0512;270.3098;272.6193];
L = [4.7113;29.9074;31.4818;30.7747;26.4824;23.221;29.1975;19.7437;
    33.0548;30.2837;32.4565;30.4459;30.4991;31.205;34.5191;29.9006;
    29.031;30.6065;30.0081;23.16;31.5809;33.4274;36.4655;32.7144;
    39.7774;32.0607;42.2745;40.916;30.7559;32.4946;35.2654;39.992;
    30.7551;33.3087;32.1131;40.9148;35.9689;38.5224;25.2654;28.4166;
    33.6859;32.9795;35.3701;46.1275;33.0873;36.2928;41.3449;35.8566;
    36.5629;33.303;38.4641;32.6505;44.6032;35.8011;38.4633;33.3017;
    36.6702;36.6696;38.7885;38.511;37.0432;43.3982;43.8319;40.0748;
    45.3444;42.4632;45.2298;46.8987;48.303;47.7588];
data.tL_juv = [t, L];
units.tL_juv   = {'d', 'cm'};  label.tL_juv = {'time since hatch', 'fork length'};  
temp.tL_juv    = C2K(24);  units.temp.tL_juv = 'K'; label.temp.tL_juv = 'temperature';
bibkey.tL_juv = 'MiyaTana2001';
% adult
L = ...
   [55.3,54,58.5,57,62.7,42,53.5,NaN,NaN,NaN,NaN;
    79,76.8,77,77,83.1,69.1,79.7,NaN,NaN,NaN,NaN;
    116.2,97.9,94.8,97,102.1,93.2,100.7,NaN,NaN,134,NaN;
    130.1,117.4,111.9,115,119.9,113,118.8,108,127,128,123.7;
    146.9,135.4,128.3,128,136.5,127,135.1,133.2,126.6,160.4,142.2;
    165.1,152,144.1,145,152,139,150.1,150.7,150.2,171.1,156;
    178.1,167.3,159.2,165,166.5,151.2,164,148,152.2,184,172.3;
    192.9,181.4,173.7,176,180.1,157,177.2,197.8,176.5,199.5,182.8;
    206.5,194.5,187.7,187,192.8,164,190.9,194.2,181.8,205.3,194;
    220.3,206.5,201,198,203.6,183,206.2,213.7,183.7,208.8,199.3;
    221.5,217.6,213.9,216,215.7,NaN,216.1,214.1,217,219.8,211;
    244,227.9,226.2,228,226.1,NaN,222.5,239.5,215.8,216.1,235.5;
    246,237.4,238,239,235.8,NaN,232.4,222.7,NaN,221.2,233.5;
    NaN,246.1,249.3,250,244.8,NaN,241.6,256.6,209.9,236.3,245;
    NaN,NaN,NaN,260,253.3,NaN,247.2,258,NaN,241.7,253.7;
    NaN,NaN,NaN,270,261.2,NaN,NaN,NaN,287,247.3,263.5;
    NaN,NaN,NaN,NaN,268.5,NaN,NaN,NaN,NaN,265,267;
    NaN,NaN,NaN,NaN,275.5,NaN,NaN,NaN,NaN,NaN,NaN;
    NaN,NaN,NaN,NaN,281.9,NaN,NaN,NaN,NaN,NaN,NaN];
a = 365 * (1:19)'; % d, age
aL1 = [a,L(:,1)]; aL2 = [a,L(:,2)]; aL3 = [a,L(:,3)]; aL4 = [a,L(:,4)];
aL5 = [a,L(:,5)]; aL6 = [a,L(:,6)]; aL7 = [a,L(:,7)]; aL8 = [a,L(:,8)];
aL9 = [a,L(:,9)]; aL10 = [a,L(:,10)]; aL11 = [a,L(:,11)];
aL1 = aL1(~isnan(aL1(:,2)),:); aL2 = aL2(~isnan(aL2(:,2)),:); 
aL3 = aL3(~isnan(aL3(:,2)),:); aL4 = aL4(~isnan(aL4(:,2)),:); 
aL5 = aL5(~isnan(aL5(:,2)),:); aL6 = aL6(~isnan(aL6(:,2)),:);
aL7 = aL7(~isnan(aL7(:,2)),:); aL8 = aL8(~isnan(aL8(:,2)),:);
aL9 = aL9(~isnan(aL9(:,2)),:); aL10 = aL10(~isnan(aL10(:,2)),:);
aL11 = aL11(~isnan(aL11(:,2)),:);
data.tL_adt = [aL1; aL2; aL3; aL4; aL5; aL6; aL7; aL8; aL9; aL10; aL11];
units.tL_adt   = {'d', 'cm'};  label.tL_adt = {'time since birth', 'total length'};  
temp.tL_adt    = C2K(24);  units.temp.tL_adt = 'K'; label.temp.tL_adt = 'temperature';
bibkey.tL_adt = 'MiyaTana2001';
  
% t-W data
data.tW = [1,4.4;2,9.5;3,16;4,25;5,40;6,58;7,76;8,95;9,120;10,145;11,170;
      12,200;13,235;14,280];
data.tW(:,1) = 365 * data.tW(:,1); data.tW(:,2) = data.tW(:,2) * 1000;
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'MiyaTana2001';

% tN-data
% age- reprod (total number of 1e6 eggs per spawning season)
data.tN = [1,0; 2,0; 3,0; 4,56.25; 5,90; 6,130.5; 7,171;
           8,213.75; 9,270; 10,326.25; 11,382.5; 12,450;
           13,528.750; 14,630];
data.tN(:,1) = data.tN(:,1) * 365; % d #, age, cumulative number of eggs in a reproductive season
units.tN   = {'d', '1e6 eggs'};  label.tN = {'time since birth', 'fecundity'};  
temp.tN    = C2K(24);  units.temp.tN = 'K'; label.temp.tN = 'temperature';
bibkey.tN = 'NisbJusu2012';

% Temp, ab (C, h)
data.Tab = [...
19.9 	41.16
20.0 	44.66
21.2 	35.75
23.7 	32.00
24.4 	29.66
26.2 	24.41
26.9 	26.41
28.0 	24.16
28.8 	23.83
29.8 	22.66
31.5 	19.66
33.4 	20.16];
data.Tab(:,2) = data.Tab(:,2)/24; % convert h to d
units.Tab   = {'C', 'd'};  label.Tab = {'temperature', 'age at birth'};  
bibkey.Tab = 'MiyaTana2000';

% L-W data
W = ... 
    [117.2196;123.8547;108.3728;130.4897;137.1248;145.9716;165.8768;
     187.9937;201.2638;232.2275;296.3665;294.1548;331.7536;238.8626;
     243.2859;305.2133;389.2575;375.9874;347.2354;389.2575;424.6445;
     475.5134;475.5134;497.6303;504.2654;475.5134;460.0316;510.9005;
     583.8863;526.3823;606.0032;524.1706;475.5134;568.4044;690.0474;
     533.0174;698.8942;612.6382;590.5213;645.8136;634.7551;643.6019;
     749.763;718.7994;670.1422;734.2812;670.1422;705.5292;712.1643;
     913.4281;827.1722;833.8073;847.0774;798.4202;935.545;942.1801;
     840.4423;962.0853;924.4866;820.5371;1028.436;1108.0569;1099.2101;
     1163.3491;1265.0869;];
L = .1 * ...
   [195.2017;197.3828;199.0185;200.6543;204.4711;211.0142;229.0076;
    230.6434;232.8244;239.3675;257.361;259.542;264.4493;264.4493;
    264.9945;269.9019;271.5376;275.3544;275.3544;276.9902;285.7143;
    291.1668;294.4384;296.6194;299.8909;299.8909;303.1625;303.7077;
    310.2508;310.7961;312.4318;312.4318;312.4318;315.7034;319.5202;
    319.5202;324.4275;324.4275;324.4275;324.9727;326.6085;328.2443;
    332.0611;332.0611;332.6063;333.6968;333.6968;340.7852;344.0567;
    349.5093;352.7808;356.5976;358.2334;358.2334;362.0502;363.6859;
    363.6859;365.3217;365.3217;365.3217;372.41;379.4984;384.9509;
    388.7677;399.1276;];
data.LW = [L,W]; % cm, g, total length, wet weight
units.LW = {'cm', 'g'}; label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'AguaGarc2005';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 10 * weights.Li;
weights.tL_lrv = 50 * weights.tL_lrv;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'birth is assumed to occur at hatch';
D2 = 'specific density of reserve and structure is taken 0.3 g/cm^3';     
D3 = 'mod_2: k_J = 0.02 1/d is imposed, more weight to tL_lrv';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Links
metaData.links.id_CoL = '56P7Q'; % Cat of Life
metaData.links.id_ITIS = '172421'; % ITIS
metaData.links.id_EoL = '46577336'; % Ency of Life
metaData.links.id_Wiki = 'Thunnus_thynnus'; % Wikipedia
metaData.links.id_ADW = 'Thunnus_thynnus'; % ADW
metaData.links.id_Taxo = '46703'; % Taxonomicon
metaData.links.id_WoRMS = '127029'; % WoRMS
metaData.links.id_fishbase = 'Thunnus-thynnus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Thunnus_thynnus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'JusuKlan2011'; type = 'Article'; bib = [ ... 
'author = {M. Jusup and T. Klanjscek and H. Matsuda and S. A. L. M. Kooijman.}, ' ... 
'year = {2011}, ' ...
'title = {A full lifecycle bioenergetic model for bluefin tuna}, ' ...
'journal = {Plos Biology}, ' ...
'volume = {6}, ' ...
'pages = {e21903}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiyaTana2000'; type = 'Article'; bib = [ ... 
'author = {Miyashita, S. and Tanaka, Y. and Sawada, Y. and Murata, O. and Hattori, N. and Takii, K. and Mukai, Y. and Kumai, H.}, ' ... 
'year = {2000}, ' ...
'title = {Embryonic development and effects of water temperature on hatching of the bluefin tuna, \emph{Thunnus thynnus}}, ' ...
'journal = {Suisanzoushoku}, ' ...
'note = {in Japanese}, ' ...
'volume = {48}, ' ...
'pages = {199-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiyaTana2001'; type = 'Article'; bib = [ ... 
'author = {Miyashita, S. and Sawada, Y. and Okada, T. and Murata, O. and Kumai, H.}, ' ... 
'year = {2001}, ' ...
'title = {Morphological development and growth of laboratory-reared larval and juvenile \emph{Thunnus thynnus} ({P}isces: {S}combridae)}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {99}, ' ...
'pages = {601-616}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NisbJusu2012'; type = 'Article'; bib = [ ... 
'author = {R. M. Nisbet and M. Jusup and T. Klanjscek and L. Pecquerie}, ' ... 
'year = {2012}, ' ...
'title = {Integrating {D}ynamic {E}nergy {B}udget ({D}{E}{B}) theory with traditional bioenergetic models}, ' ...
'journal = {J. Exp. Biol.}, ' ...
'volume = {215}, ' ...
'pages = {892--902}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AguaGarc2005'; type = 'Article'; bib = [ ... 
'author = {Aguado-Gimenez, F. and Garcia-Garcia, B.}, ' ... 
'year = {2005}, ' ...
'title = {Growth, food intake and feed conversion rates in captive {A}tlantic bluefin tuna (\emph{Thunnus thynnus} {L}innaeus, 1758) under fattening conditions}, ' ...
'journal = {Aquacult. Res.}, ' ...
'volume = {36}, ' ...
'pages = {610-614}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/147}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

