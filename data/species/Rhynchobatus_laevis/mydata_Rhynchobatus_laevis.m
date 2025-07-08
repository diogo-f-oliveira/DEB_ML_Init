function [data, auxData, metaData, txtData, weights] = mydata_Rhynchobatus_laevis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rhinopristiformes'; 
metaData.family     = 'Rhinidae';
metaData.species    = 'Rhynchobatus_laevis'; 
metaData.species_en = 'Smoothnose wedgefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MI', 'MPW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2019 03 19];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 19]; 

%% set data
% zero-variate data;
data.am = 12*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'WhitSimp2014';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 48;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'WhitSimp2014';
  comment.Lb = '46 to 50 cm';
data.Lp  = 130;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
data.Li  = 270;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 685; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'fishbase','WhitSimp2014'};
 comment.Wwb = 'estimate based on 0.00646*Lb^2.99, see F2';
data.Wwp = 13.3e3; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'fishbase','WhitSimp2014'};
 comment.Wwp = 'estimate based on 0.00389*Lp^3.12, see F2';
data.Wwi = 1.5e5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
 comment.Wwi = 'estimate based on 0.00389*Li^3.12, see F2';

data.Ri  = 14/365;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '7 to 19 pups per yr';
  
% uni-variate data at f
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.947	133.787
0.947	50.454
0.969	89.002
0.969	84.467
1.959	69.728
1.959	100.340
1.959	104.875
1.980	51.020
1.980	59.524
1.980	132.086
2.023	111.678
2.971	63.492
2.971	73.696
2.971	78.231
2.971	130.386
2.992	94.104
2.992	161.565
4.025	96.372
4.025	105.442
4.951	121.882
4.951	104.875
4.973	172.903
4.973	163.832
4.973	135.488
4.994	125.283
5.963	176.304
5.984	141.156
5.984	166.100
6.006	94.671
6.006	208.050
6.975	214.286
6.996	185.374
6.996	180.272
6.996	165.533
7.018	191.043
7.018	145.692
7.018	135.488
7.986	263.039
7.986	186.508
8.008	220.522
9.020	134.921
9.020	235.261
10.031	230.159
11.000	183.673
11.022	150.794];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
  temp.tL = C2K(28); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WhitSimp2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males and females are assumed not to differ';
D2 = 'Temperatures are guessed, based in preferred temperature as given in fishbase';
D3 = 'R. palpebratus and R. laevis could not be distinguised, so this entry may be a mix of both species';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'ovoviviparous';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-weight: Ww in g = 0.00389*(TL in cm)^3.12';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4SRJD'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560718'; % Ency of Life
metaData.links.id_Wiki = 'Rhynchobatus_laevis'; % Wikipedia
metaData.links.id_ADW = 'Rhynchobatus_laevis'; % ADW
metaData.links.id_Taxo = '186095'; % Taxonomicon
metaData.links.id_WoRMS = '278218'; % WoRMS
metaData.links.id_fishbase = 'Rhynchobatus-laevis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Rhynchobatus_laevis}}'; 
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
bibkey = 'WhitSimp2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12359}, ' ...
'author = {J. White and C. A. Simpfendorfer and A. J. Tobin and M. R. Heupel}, ' ...
'year = {2014}, ' ...
'title  = {Age and growth parameters of shark-like batoids}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {84}, ' ...
'pages = {1340-1353}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Rhynchobatus-laevis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  