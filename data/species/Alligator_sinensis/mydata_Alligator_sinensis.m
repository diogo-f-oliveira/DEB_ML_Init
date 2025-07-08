function [data, auxData, metaData, txtData, weights] = mydata_Alligator_sinensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Alligator_sinensis'; 
metaData.species_en = 'Chinese alligator'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFm', 'biFp', 'biFp', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, JacoKush1989: envir temp between 21 and 29
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 09 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 09 18];


%% set data
% zero-variate data

data.ab = 70;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'ADW';   
  temp.ab = C2K(25.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6*365;  units.tp = 'd';    label.tp = 'time since birth at puberty for female';  bibkey.tp = 'ADW';
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '5-7 yrs';
data.am = 65*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 21;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';            bibkey.Lb  = 'ADW'; 
data.Lp  = 101;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';          bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to A. mississippiensis: 170 * 180/304';
data.Li  = 170;    units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'ADW';
data.Lim  = 210;   units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';  bibkey.Lim  = 'Wiki';

data.Ww0 = 45;     units.Ww0 = 'g';  label.Ww0 = 'initial wet weight';             bibkey.Ww0 = 'Wiki';
data.Wwb = 30;     units.Wwb = 'g';  label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'ADW';
data.Wwi = 23.9e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight of female';  bibkey.Wwi = {'Wiki','ADW'};
 comment.Wwi = 'based on (Li/Lim)^3*Wwim';
data.Wwim = 45e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';   bibkey.Wwim = 'Wiki';

data.Ri  = 25/365;   units.Ri  = '#/d'; label.Ri  = 'reprod rate at 364 cm';   bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-40 eggs per clutch, 1 cutch per yr assumed';
 
% uni-variate data

% time-length Data 
data.tL = [ ... % time since birth (d), total length (cm)
0.451	22.694
17.599	25.648
23.917	27.047
43.321	29.378
58.213	29.689
73.105	30.155
87.094	32.021
100.632	34.041
114.621	36.373
129.061	38.083
145.307	40.415
156.137	41.969
170.578	43.523
185.018	44.611
201.264	45.699];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'HerbCoul2002'};
 
% time-weight Data 
data.tW = [ ... % time since birth (d), wet weight (g)
0.443	30.272
15.957	36.826
24.379	55.241
42.110	75.858
57.624	78.087
72.695	78.152
86.436	98.752
100.177	120.433
114.805	142.118
127.660	168.120
144.060	193.055
156.915	230.949
169.770	252.626
185.284	264.585
200.355	287.353];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(25);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'HerbCoul2002'};

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'temperature effects sex of neonate: below  30 C neonates are female and above 34 C male';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'BTRF'; % Cat of Life
metaData.links.id_ITIS = '202209'; % ITIS
metaData.links.id_EoL = '796028'; % Ency of Life
metaData.links.id_Wiki = 'Alligator_sinensis'; % Wikipedia
metaData.links.id_ADW = 'Alligator_sinensis'; % ADW
metaData.links.id_Taxo = '50617'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Alligator&species=sinensis'; % ReptileDB
metaData.links.id_AnAge = 'Alligator_sinensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Alligator_sinensis}}';
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
bibkey = 'HerbCoul2002'; type = 'Article'; bib = [ ... 
'author = {J.D. Herbert and T.D. Coulson and R.A. Coulson}, ' ... 
'year = {2002}, ' ...
'title = {Growth rates of {C}hinese and {A}merican alligators}, ' ...
'journal = {Comparative Biochemistry and Physiology Part A}, ' ...
'volume = {131}, ' ...
'pages = {909–916}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Alligator_sinensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Alligator_sinensis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

