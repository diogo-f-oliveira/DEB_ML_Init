function [data, auxData, metaData, txtData, weights] = mydata_Ciona_intestinalis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Ascidiacea'; 
metaData.order      = 'Phlebobranchia'; 
metaData.family     = 'Cionidae';
metaData.species    = 'Ciona_intestinalis'; 
metaData.species_en = 'Vase tunicate'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'L-Wd_f'; 'X-dL_L'; 'X-dWd_W'; 't-L_f'; 'Wd-JO_f'; 'X-JC_W'; 'X-JX_W'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2011 11 05];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 11 06]; 


%% set data
% zero-variate data;
data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'CiriTosc2002';    
  temp.ab = C2K(21); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature (18-22 C); ab is actually less than a day';
data.ap = 60;     units.ap = 'd';    label.ap = 'age at puberty';         bibkey.ap = 'CiriTosc2002';
  temp.ap = C2K(21); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 2*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'biotic';   
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.1;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'CiriTosc2002';
  comment.Lb = 'plus or minus 0.03 cm at settlement (start of feeding)';
data.Lp  = 5;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'CiriTosc2002';
data.Li  = 15;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'biotic';

data.Ri  = 3000 * 2/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'BIOTIC 3000 per spawn, but possibly more spawns per year; Dybe1965: 2 generation/yr';

% uni-variate data at f
% data from CiriTosc2002; max length = 9 cm in culture, so death at 70 d.
% length excludes stalk
% sperm at day 45, eggs at day 60
% T = 273 + 21 K
% continuous food supply (provided by Salt Creek, Inc.): age(d), turnover (1/d), Spirulina, progression, revolution
%  5 d   10/d   1.5 g   0.5 g   2.0 ml      f
% 15 d    7/d   1.5 g   0.5 g   2.0 ml  0.7*f
% 20 d    7/d   2.0 g   0.7 g   2.5 ml  0.9*f
% 30 d    7/d   3.0 g   1.0 g   4.0 ml  1.4*f
% after 30d food supply remained constant

% time-length
data.tL = [ ... % time since hatching (d), g (mm)
0	0.2
5	0.6
10	1.3
15	2.1
20	4
25	10.1
30	22
35	35
40	43
45	47
50	62
55	64
60	79.7
70	89.7];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL = {'d', 'cm'};     label.tL = {'time since hatching', 'length'};  
temp.tL = C2K(21); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CiriTosc2002'; 

% Data from PeteScho95: 3 experiments T = 273 + 10 K
% food: Rhodomonas: cell diameter 6 mum; 113 mum^3/cell; 42e-12 gC/cell
% total dry weight (Wdt) includes tunic, body dry weight excluding the tunic(Wdb) 
% The tunic is assumed to be propto structure so Wdt = L^3 d_V (wt + f * w) while Wdb = L^3 d_V (1 + f * w)
%
% exp 1
% cells/ml  Wdb(0) mg Wdt(0) mg  L(0)cm  Wdb(13) mg Wdt(13)mg  L(13) cm  d
XWWLWWL1 = [ ...
      0          10.9      22.2   3.06          9.8      22.0      2.98  13
   2949          10.9      22.2   3.06         24.2      40.1      4.11  13
   5986          16.2      34.5   3.62         29.7      49.9      4.14  13
  11976          16.2      34.5   3.62         28.8      48.4      4.03  13]; 
%
% exp 2
% cells/ml  Wdb(0) mg Wdt(0) mg          Wdb(15) mg Wdt(15)mg  d
XWWWW2 = [ ...
      0          49.9     120.2                49.5     135.2  10
    947          39.1     100.3                61.6     121.9  13
   1833          45.1     118.7                82.9     155.9  15
   3078          50.4     127.5               106.0     192.3  15
   5700          46.0     107.2                90.8     160.7  15
   7569          54.7     132.3               105.6     193.0  15];
%
% exp 3
% cells/ml  Wdb(0) mg Wdt(0) mg  L(0)cm  Wdb(16) mg Wdt(16)mg  L(16) cm  d
XWWLWWL3 = [ ...
      0          12.6      24.1   3.52          9.7      22.2      3.52  16
    474          12.6      24.1   3.52         19.3      34.7      4.64  16
    842          12.6      24.1   3.52         26.7      44.7      5.06  16
   1884          12.6      24.1   3.52         32.7      53.1      5.18  16
   3922          12.6      24.1   3.52         41.3      65.6      5.47  16
   8226          12.6      24.1   3.52         43.8      70.4      5.21  16];
% compose univar-data from these data
%
% L-Wd: length cm, body dry weight, g
data.LWdb = [XWWLWWL1(:,[4 2]); XWWLWWL1(:,[7 5]); XWWLWWL3(:,[4 2]); XWWLWWL3(:,[7 5])];
data.LWdb(:,2) = data.LWdb(:,2)/1e3; % g, convert mg to g
units.LWdb = {'cm', 'g'}; label.LWdb = {'length', 'body dry weight (excl tunic)'};  
bibkey.LWdb = 'PeteScho1995'; 
%
% L-Wd: length cm, total dry weight, g
data.LWdt = [XWWLWWL1(:,[4 3]); XWWLWWL1(:,[7 6]); XWWLWWL3(:,[4 3]); XWWLWWL3(:,[7 6])];
data.LWdt(:,2) = data.LWdt(:,2)/1e3; % g, convert mg to g
units.LWdt = {'cm', 'g'}; label.LWdt = {'length', 'total dry weight (incl tunic)'};  
bibkey.LWdt = 'PeteScho1995'; 
%
% X-dL_L: food density (cells/ml), Wd(end) (mg), Wd(0)(mg), days
XdL = [XWWLWWL1(:,[1 7 4 8]); XWWLWWL3(:,[1 7 4 8])]; data.XdL = XdL(:,[1 2]);
initL.XdL = XdL(:,3); units.initL.XdL = 'cm'; label.initL.XdL = 'inital body length';
t_exp.XdL = XdL(:,4); units.t_exp.XdL = 'd'; label.t_exp.XdL = 'experiment duration';
units.XdL  = {'cells/ml', 'cm'}; 
label.XdL  = {'food density', 'final length'};  
temp.XdL   = C2K(10); units.temp.XdL = 'K'; label.temp.XdL = 'temperature';
treat.XdL = {0}; units.treat.XdL = ''; label.treat.XdL = '';
bibkey.XdL = 'PeteScho1995';      
%
% X-dW_W: food density (cells/ml), Wd(end) (mg), Wd(0)(mg), days d
XdWdb  = [XWWLWWL1(:,[1 5 2 8]); XWWWW2(:,[1 4 2 6]); XWWLWWL3(:,[1 5 2 8])]; data.XdWdb = XdWdb(:,[1 2]); 
initWd.XdWdb = XdWdb(:,3); units.initWd.XdWdb = 'mg'; label.initWd.XdWdb = 'inital body dry weight';
t_exp.XdWdb = XdWdb(:,4); units.t_exp.XdWdb = 'd'; label.t_exp.XdWdb = 'experiment duration';
units.XdWdb = {'cells/ml', 'mg'}; 
label.XdWdb = {'food density', 'final body dry weight'}; 
treat.XdWdb = {0}; units.treat.XdWdb = ''; label.treat.XdWdb = '';
bibkey.XdWdb = 'PeteScho1995'; 
%
% X-dW_W: food density (cells/ml), Wd(end) (mg), Wd(0)(mg), days
XdWdt  = [XWWLWWL1(:,[1 6 3 8]); XWWWW2(:,[1 5 3 6]); XWWLWWL3(:,[1 6 3 8])]; data.XdWdt = XdWdt(:,[1 2]); 
initWd.XdWdt = XdWdt(:,3); units.initWd.XdWdt = 'mg'; label.initWd.XdWdt = 'inital body dry weight';
t_exp.XdWdt = XdWdt(:,4); units.t_exp.XdWdt = 'd'; label.t_exp.XdWdt = 'experiment duration';
units.XdWdt = {'cells/ml', 'mg'};
label.XdWdt = {'food density', 'final total dry weight'};   
temp.XdWdt = C2K(10); units.temp.XdWdt = 'K'; label.temp.XdWdt = 'temperature';
treat.XdWdt = {0}; units.treat.XdWdt = ''; label.treat.XdWdt = '';

bibkey.XdWdt = 'PeteScho1995';      
%
% exp 2 food dens (muC/l), ingestion (body, total: muC/d.mgC), spec growth (body, total: mugC/d.mgC), 
%     spec respiration in CO2 (body, total: mugC/d.mgC)
XJXrJC2 = [...
  9  20  10 -2  9 22 10
 50 136  77 37 20 27 18
 88 175 101 49 28 35 23
141 194 114 57 37 34 23
255 230 146 69 48 36 26
333 294 185 72 49 37 26];
% exp 3 food dens (muC/l), ingestion (body, total: muC/d.mgC), spec growth (body, total: mugC/d.mgC), 
%     spec respiration in CO2 (body, total: mugC/d.mgC)
XJXrJC3 = [...
  1   8   5 -18 -11  14   8
 33  90  66  28  26  17  14
 45 142 107  48  44  20  16
 91 206 156  61  56   0   0
178 284 215  76  71  38  29
366 312 243  83  76  33  26];
% compose univar-data from these data
% X-JX_W: food density (mug C/l), ingestion rate (mugC/d.mgC), body dry weight (mg)
XJX = [[XJXrJC2(:,[1 2]), XWWWW2(:,2)]; [XJXrJC3(:,[1 2]), XWWLWWL3(:,2)]];
XJX(:,1) = XJX(:,1) * 1e-6/12; % convert mug C/ l to M
data.XJX = XJX(:,[1 2]);
Wdry.XJX =  XJX(:,3); units.Wdry.XJX = 'mg'; label.Wdry.XJX = 'body dry weight';
units.XJX     = {'mol C/l', 'mugC/d.mgC'}; 
label.XJX     = {'food density', 'ingestion rate'};  
temp.XJX      = C2K(10); units.temp.XJX = 'K'; label.temp.XJX = 'temperature';
treat.XJX = {0}; units.treat.XJX = ''; label.treat.XJX = '';
bibkey.XJX    = 'PeteScho1995'; 
%
% X-JC_W: food density (mug C/l), repiration rate (mugC/d.mgC), body dry weight (mg)
XJC = [[XJXrJC2(:,[1 6]), XWWWW2(:,2)]; [XJXrJC3(:,[1 6]), XWWLWWL3(:,2)]];
XJC(:,1) = XJC(:,1) * 1e-6/12; % convert mug C/ l to M
XJC(10,:) = []; data.XJC = XJC(:,[1 2]);
Wdry.XJC = XJC(:,3); units.Wdry.XJC = 'mg'; label.Wdry.XJC = 'body dry weight';
units.XJC = {'mol C/l', 'mugC/d.mgC'}; 
label.XJC = {'food density', 'respiration rate'};  
temp.XJC = C2K(10); units.temp.XJC = 'K'; label.temp.XJC = 'temperature'; 
bibkey.XJC = 'PeteScho1995'; 
treat.XJC = {0}; units.treat.XJC = ''; label.treat.XJC = '';

% weight-respiration
data.WdJO = [ ... % dry weight (g, total, including tunic), O2 consumption (ml/h);
0.011	0.005
0.016	0.004
0.017	0.003
0.020	0.005
0.021	0.007
0.028	0.005
0.033	0.008
0.038	0.004
0.040	0.012
0.041	0.015
0.057	0.031
0.072	0.025
0.080	0.041
0.081	0.011
0.120	0.019
0.121	0.041
0.141	0.039
0.179	0.031
0.189	0.053
0.225	0.044
0.243	0.063
0.247	0.036
0.271	0.028
0.281	0.053
0.322	0.043
0.380	0.057
0.401	0.092
0.498	0.113
0.600	0.056
0.753	0.109];
units.WdJO = {'g', 'ml O2/h'}; label.WdJO = {'total dry weight', 'respiration rate'};  
temp.WdJO = C2K(10); units.temp.WdJO = 'K'; label.temp.WdJO = 'temperature'; 
bibkey.WdJO = 'Shum1978'; 
comment.WdJO = 'air-saturated water, salinity 32 promille';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp   = temp;
auxData.initL = initL;
auxData.initWd = initWd;
auxData.Wdry = Wdry;
auxData.treat = treat;
auxData.t_exp = t_exp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Length till 1 cm was measured with an ocular micrometer, probably under a microscope. Larger animals were measured with a ruler, problably while remaining in the culture vessel. The growth curve suggests that putting them under a microscope affects growth.';     
D2 = 'Assumption concerning Food: Rhodomonas: cell diameter 6 mum; 113 mum^3/cell; 42e-12 gC/cell';
D3 = 'Total dry weight (Wdt) includes tunic, body dry weight excluding the tunic (Wdb). The tunic is assumed to be propto structure so Wdt = L^3 d_V (wt + f * w) while Wdb = L^3 d_V (1 + f * w)';
metaData.discussion = struct('D1',D1, 'D2', D2, 'D3', D3); 

%% Facts
F1 = 'Condition index = body dry wt (excluding tunic)/ total dry wt (inclunding tunic)';
metaData.bibkey.F1 = 'PeteScho1995';
F2 = 'Larval stage does not feed, lasts minutes to hours at 20 C.';
metaData.bibkey.F2 = 'PeteScho1995';
F3 = 'Hermaphroditic; external fertilisation; sperm lives for 16 h.';
metaData.bibkey.F3 = 'PeteScho1995';
metaData.facts = struct('F1',F1, 'F2', F2, 'F3', F3);

%% Links
metaData.links.id_CoL = 'VFCZ'; % Cat of Life
metaData.links.id_ITIS = '159113'; % ITIS
metaData.links.id_EoL = '46584142'; % Ency of Life
metaData.links.id_Wiki = 'Ciona_intestinalis'; % Wikipedia
metaData.links.id_ADW = 'Ciona_intestinalis'; % ADW
metaData.links.id_Taxo = '41508'; % Taxonomicon
metaData.links.id_WoRMS = '103732'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ciona_intestinalis}}'; 
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
bibkey = 'CiriTosc2002'; type = 'article'; bib = [ ...
'author = {Cirino, P. and Toscano, A. and Caramiello, D. and Macina, A. and Miraglia, V. and Monte A.}, ' ...
'year = {Nov 27, 2002}, ' ...
'title  = {Laboratory Culture of the Ascidian \emph{Ciona intestinalis} ({L}.): {A} Model System For Molecular Developmental Biology Research}, ' ...
'journal = {Marine models electronic record}, ' ...
'howpublished = {\url{http://hermes.mbl.edu/BiologicalBulletin/MMER/cirino/CirCon.html}}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'biotic'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=4218}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PeteScho1995'; type = 'article'; bib = [ ...
'author = {Petersen, J. K. and Schou, O. and Thor, P.}, ' ...
'year = {1995}, ' ...
'title  = {Growth and energetics in the ascidian \emph{Ciona intestinalis}}, ' ...
'journal = {Mar Ecol Prog Ser}, ' ...
'volume = {120}, '...
'pages = {175-184}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shum1978'; type = 'article'; bib = [ ...
'author = {Shumway, S. E.}, ' ...
'year = {1978}, ' ...
'title  = {Respiration, Pumping Activity and Heart Rate in \emph{Ciona intestinalis} Exposed to Fluctuating Salinities}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {48}, '...
'pages = {235--242}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dybe1965'; type = 'article'; bib = [ ...
'author = {Dybern, B. J.}, ' ...
'year = {1965}, ' ...
'title  = {The life cycle of \emph{Ciona intestinalis} ({L}.) {f}. \emph{typica} in relation to the environmental temperature}, ' ...
'journal = {Oikos}, ' ...
'volume = {16}, '...
'pages = {109--131}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
