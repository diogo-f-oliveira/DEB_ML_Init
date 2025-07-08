function [data, auxData, metaData, txtData, weights] = mydata_Eunectes_notaeus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Boidae';
metaData.species    = 'Eunectes_notaeus'; 
metaData.species_en = 'Yellow anaconda'; 

metaData.ecoCode.climate = {'Aw', 'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr', '0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 03];

%% set data
% zero-variate data

data.ab = 6*30.5;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'ADW';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed';
data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'ADW';
  temp.ap = C2K(29);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 23.6*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 60;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';          bibkey.Lb  = 'ADW';
data.Lp  = 165;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'WallMico2007'; 
data.Lpm  = 135;   units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm = 'WallMico2007'; 
data.Li  = 335+30.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';bibkey.Li  = 'WallMico2007';
data.Lim  = 225+29.2;  units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males'; bibkey.Lim = 'WallMico2007';

data.Wwb = 104; units.Wwb = 'g';   label.Wwb = 'wet weight at birth for female';   bibkey.Wwb = 'WallMico2007';
data.Wwbm = 101; units.Wwbm = 'g';   label.Wwbm = 'wet weight at birth for male';  bibkey.Wwbm = 'WallMico2007';
data.Wwi = 29000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'WallMico2007';
data.Wwim = 10500;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male'; bibkey.Wwim = 'WallMico2007';

data.Ri  = 40/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time (yr), length (cm)
1926.962	 56.960
1928.009	142.738
1928.988	211.553
1929.993	251.798
1930.957	282.451
1931.970	302.902
1933.003	312.378];
data.tL_f(:,1) = (data.tL_f(:,1) - data.tL_f(1,1)) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time', 'total length', 'female, high food'};  
temp.tL_f    = C2K(29);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Petz1984';
comment.tL_f = 'Data for female, high food';
%
data.tL_m = [ ... % time (yr), length (cm)
1926.964	51.828
1927.961	111.133
1928.952	151.358
1929.953	201.866
1930.906	222.235
1931.950	242.727
1932.937	252.874];
data.tL_m(:,1) = (data.tL_m(:,1) - data.tL_m(1,1)) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time', 'total length', 'male, high food'};  
temp.tL_m    = C2K(29);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Petz1984';
comment.tL_m = 'Data for male, high food';
%
data.tL_m1 = [ ... % time (yr), length (cm)
1929.581	42.924
1929.947	66.894
1930.906	111.476
1931.914	142.924
1932.927	164.108
1933.881	183.744];
data.tL_m1(:,1) = (data.tL_m1(:,1) - data.tL_m1(1,1)) * 365; % convert yr to d
units.tL_m1   = {'d', 'cm'};  label.tL_m1 = {'time', 'total length', 'male, low food'};  
temp.tL_m1    = C2K(29);  units.temp.tL_m1 = 'K'; label.temp.tL_m1 = 'temperature';
bibkey.tL_m1 = 'Petz1984';
comment.tL_m1 = 'Data for male, low food';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.tL_m1 = 5 * weights.tL_m1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m','tL_m1'}; subtitle1 = {'Data for high-food female, male, low-food male'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';   
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Anacodas are ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GYDP'; % Cat of Life
metaData.links.id_ITIS = '634803'; % ITIS
metaData.links.id_EoL = '794660'; % Ency of Life
metaData.links.id_Wiki = 'Eunectes_notaeus'; % Wikipedia
metaData.links.id_ADW = 'Eunectes_notaeus'; % ADW
metaData.links.id_Taxo = '49884'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eunectes&species=notaeus'; % ReptileDB
metaData.links.id_AnAge = 'Eunectes_notaeus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eunectes_notaeus}}';
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
bibkey = 'Petz1984'; type = 'Book'; bib = [ ... 
'author = {Petzold, H.-G.}, ' ... 
'year = {1984}, ' ...
'title = {Die Anakondas Gattung \emph{Eunectes}}, ' ...
'series = {Die neue Brehm Buecherei}, ' ...
'volume = {554}, ' ...
'publisher = {A. Ziemsen Verlag}, ' ...
'address = {Wittenberg Lutherstadt}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Eunectes_notaeus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Eunectes_notaeus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WallMico2007'; type = 'Incollection'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Waller, T. and Micucci, P. A. and Alvarenga, E.}, ' ...
'year = {2007}, ' ...
'title  = {Conservaton biology of the Yellow Anaconda (\emph{Eunectes notaeus}) in northeastern {A}rgentina}, ' ...
'booktitle = {Biology of the Boas and Phythons}, ' ...
'editor = {Henderson, R. W. and Powell, R.}, ' ...
'publisher = {Eagle Mountain Publ., Utah}, ' ...
'pages = {340--362}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

