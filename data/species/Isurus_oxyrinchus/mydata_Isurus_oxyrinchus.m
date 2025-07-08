function [data, auxData, metaData, txtData, weights] = mydata_Isurus_oxyrinchus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Lamniformes'; 
metaData.family     = 'Lamnidae';
metaData.species    = 'Isurus_oxyrinchus'; 
metaData.species_en = 'Shortfin mako'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCic', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 08 08];


%% set data
% zero-variate data

data.ab = 16.5*30.5;  units.ab = 'd';    label.ab = 'age at birth';       bibkey.ab = 'fishbase';   
  temp.ab = C2K(26); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '15 till 18 months';
data.tp = 18 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ADW';
  temp.tp = C2K(26); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 8 * 365;  units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'ADW';
  temp.tpm = C2K(26); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 32*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'fishbase';   
  temp.am = C2K(26); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'AnAge gives 25; Wiki 29 yr for males, 32 yr for females';

data.Lb  = 65;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'fishbase'; 
  comment.Lb = '60 till 70 cm; TL 65 corresponds with 60 cm FL, see F3';
data.Lp  = 300;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'Wiki'; 
  comment.Lim = 'computed from fork length 275 cm: 275 * 171/157';
data.Lpm  = 201;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'Wiki'; 
  comment.Lim = 'computed from fork length 185 cm: 185 * 171/157';
data.Li  = 365;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'Wiki';
  comment.Lim = 'computed from fork length 335 cm: 335 * 171/157';
data.Lim  = 283;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'Wiki';
  comment.Lim = 'computed from fork length 260 cm: 260 * 171/157';

data.Wwb = 2e3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Wiki';
  comment.Wwi = 'computed as 5.2432e-3 * (FL in cm)^3.1407, see F3';
data.Wwp = 200e3;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty for females';      bibkey.Wwp = 'Wiki';
  comment.Wwi = 'computed as 5.2432e-3 * (FL in cm)^3.1407, see F3';
data.Wwpm = 130e3;  units.Wwpm = 'g';   label.Wwpm = 'wet weight at puberty for males';      bibkey.Wwpm = 'Wiki';
  comment.Wwi = 'computed as 5.2432e-3 * (FL in cm)^3.1407, see F3';
data.Wwi = 505.8e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Wiki';
  comment.Wwi = 'computed as 5.2432e-3 * (FL in cm)^3.1407, see F3';
data.Wwim = 201.5e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = 'Wiki';
  comment.Wwim = 'computed as 5.2432e-3 * (FL in cm)^3.1407, see F3';
 
data.Ri  = 10/365/2.6;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 till 16 pups per litter every 3 yr';

 % uni-variate data
 
% t-L data 
data.tL = [ ... % time since birth (yr), total length (cm)
0.822	77.844
0.824	100.028
0.911	117.396
0.954	115.003
0.976	87.458
0.976	94.644
0.976	104.225
0.976	110.812
0.998	124.585
1.919	108.418
1.952	122.221
1.973	107.851
1.973	118.629
1.973	131.803
1.973	136.593
1.973	143.779
2.017	115.038
2.039	127.015
2.928	133.032
2.971	116.267
2.971	120.459
2.993	127.046
2.993	137.825
2.993	143.813
2.993	149.202
2.993	153.993
2.993	156.987
3.947	128.276
3.990	149.235
3.990	157.619
3.990	161.810
3.990	164.205
3.990	166.601
3.990	170.193
4.012	133.068
4.012	135.464
4.012	138.458
4.012	142.649
4.012	152.829
4.945	173.219
4.988	145.077
4.988	156.454
4.988	159.448
4.988	166.634
5.964	173.253
5.964	179.241
5.986	163.074
5.986	167.865
6.983	184.664
6.983	202.628
7.005	175.683
7.937	195.474
8.978	208.084
11.971	241.716
12.947	241.150
14.964	268.762
17.957	289.820];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'RiboGalv2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviparity (aplacental viviparity), with embryos feeding on other ova produced by the mother (oophagy) after the yolk sac is absorbed';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Preferred temp 26 C, usually 0 - 150 m deep';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'FL 157 cm = TL 171 cm; Ww (in g) = 5.2432e-3 * (FL in cm)^3.1407';
metaData.bibkey.F3 = 'KohlCase1996'; 
F4 = 'Fastest shark, 68 km/h';
metaData.bibkey.F4 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = '3QDF9'; % Cat of Life
metaData.links.id_ITIS = '159924'; % ITIS
metaData.links.id_EoL = '46559753'; % Ency of Life
metaData.links.id_Wiki = 'Isurus_oxyrinchus'; % Wikipedia
metaData.links.id_ADW = 'Isurus_oxyrinchus'; % ADW
metaData.links.id_Taxo = '41907'; % Taxonomicon
metaData.links.id_WoRMS = '105839'; % WoRMS
metaData.links.id_fishbase = 'Isurus-oxyrinchus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Isurus_oxyrinchus}}';
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
bibkey = 'RiboGalv2005'; type = 'Article'; bib = [ ... 
'author = {M. C. Ribot-Carballal and F. Galvan-Magana and C. Quinonez-Velazquez}, ' ... 
'year = {2005}, ' ...
'title = {Age and growth of the shortfin mako shark, \emph{Isurus oxyrinchus}, from the western coast of {B}aja {C}alifornia {S}ur, {M}exico}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {76}, ' ...
'pages = {14-21}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KohlCase1996'; type = 'Report'; bib = [ ... 
'author = {N. E. Kohler and J. G. Casey and P. A. Turner}, ' ... 
'year = {1996}, ' ...
'title = {Length-Length and Length-Weight Relationships for 13 Shark Species from the {W}estern {N}orth {A}tlantic}, ' ...
'institution = {NOAA Technical Memorandum}, ' ...
'volume = {NMFS-NE-110}, ' ...
'howpublished = {\url{https://www.nefsc.noaa.gov/publications/tm/tm110/tm110.pdf}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Isurus-oxyrinchus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Isurus_oxyrinchus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Isurus_oxyrinchus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

