function [data, auxData, metaData, txtData, weights] = mydata_Daboia_russelii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Daboia_russelii'; 
metaData.species_en = 'Russell''s viper'; 

metaData.ecoCode.climate = {'Aw', 'BSh', 'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iThh', '0iTg', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv', 'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2018 08 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 08 31];

%% set data
% zero-variate data

data.ab = 6*30.5;     units.ab = 'd';    label.ab = 'age at birth';  bibkey.ab = 'Wiki';
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 690;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'Wiki';
  temp.ap = C2K(27); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 15*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'AnAge';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 27;    units.Lb  = 'cm';  label.Lb  = 'total length at hatching';      bibkey.Lb  = 'NaulBrul1981';  
data.Lp  = 100;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Wiki';
data.Li  = 166;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';
  
data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(27);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data 
data.tL_f = [ ... % time (yr), total (cm)
0.061	27.401
0.430	40.031
0.564	45.520
0.691	53.018
0.782	59.417
0.891	64.540
1.182	78.990
1.297	79.181
1.400	82.476
1.527	86.504
1.952	95.302
2.527	102.833
3.545	113.501
4.315	113.557
5.139	113.617
5.606	115.112];
data.tL_f(:,1) = 365 * (data.tL_f(:,1) - data.tL_f(1,1)); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f   = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'NaulBrul1981';
comment.tL_f = 'data for females; temp between 18 and 40 C';
%
data.tL_m = [ ... % time (yr), total (cm)
0.061	27.767
0.430	32.360
0.576	38.946
0.691	48.452
0.782	56.130
0.867	61.615
1.182	74.059
1.297	76.076
1.400	78.458
1.564	87.237
1.933	96.214
2.521	106.302
3.564	115.328
4.309	116.661
5.139	118.731];
data.tL_m(:,1) = 365 * (data.tL_m(:,1) - data.tL_m(1,1)); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m   = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'NaulBrul1981';
comment.tL_m = 'data for males; temp between 18 and 40 C';

% L-Ww data 
data.LW_f = [ ... % total length (cm), weight (g)
 91 452
 88 407
103 762
 95 481
 98 514
 95 523
111 895
112 701
111 761
 98 447
107 552
116 918
105 641
102 509
107 505
 98 383];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight', 'female'};  
bibkey.LW_f = 'NaulBrul1981';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % total length (cm), weight (g)
 98 462
 90 450
 91 433
100 478
102 576
 95 575
 96 495
114 673
110 726
100 482
103 483
110 541];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight', 'male'};  
bibkey.LW_m = 'NaulBrul1981';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '33SV5'; % Cat of Life
metaData.links.id_ITIS = '634966'; % ITIS
metaData.links.id_EoL = '795118'; % Ency of Life
metaData.links.id_Wiki = 'Daboia_russelii'; % Wikipedia
metaData.links.id_ADW = 'Daboia_russelii'; % ADW
metaData.links.id_Taxo = '646304'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Daboia&species=russelii'; % ReptileDB
metaData.links.id_AnAge = 'Daboia_russelii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Daboia_russelii}}';
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
bibkey = 'NaulBrul1981'; type = 'Article'; bib = [ ... 
'author = {Naulleau, G. and Brule, B. V. D.}, ' ... 
'doi = {10.1111/j.1748-1090.1981.tb01974.x}, ' ...
'year = {1981}, ' ...
'title = {Feeding, growth, moult and venom production in the Russell''s viper in captivity}, ' ...
'journal = {International Zoo Yearbook}, ' ...
'volume = {21}, ' ...
'number = {1}, ' ...
'pages = {163-172}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Daboia_russelii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

