function [data, auxData, metaData, txtData, weights] = mydata_Nanorana_taihangnica
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Dicroglossidae';
metaData.species    = 'Nanorana_taihangnica'; 
metaData.species_en = 'Taihangshan swelled-vented frog'; 

metaData.ecoCode.climate = {'Cwa', 'Cfa', 'Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFc'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 15];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 15]; 

%% set data
% zero-variate data

data.tj = 2.5*365; units.tj = 'd';    label.tj = 'time since birth at metam';       bibkey.tj = 'ZhanLu2013';   
  temp.tj = C2K(11);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3*365; units.tp = 'd';    label.tp = 'time since metam at puberty for female';   bibkey.tp = 'ZhanLu2013';   
  temp.tp = C2K(11);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 2*365; units.tpm = 'd';    label.tpm = 'time since metam at puberty  for male'; bibkey.tpm = 'ZhanLu2013';   
  temp.tpm = C2K(11);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                         bibkey.am = 'ZhanLu2013';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 3.6;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';                      bibkey.Lj  = 'ZhanLu2013';
data.Lp  = 6.4;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for female';         bibkey.Lp  = 'ZhanLu2013';
  comment.Lp = 'based on tp = 3 yr and tL_f data';
data.Lpm  = 5.3;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for male';        bibkey.Lpm  = 'ZhanLu2013';
  comment.Lpm = 'based on tp = 2 yr and tL_m data';
data.Li  = 9.2;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'ZhanLu2013';
data.Lim  = 8.2; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';          bibkey.Lim  = 'ZhanLu2013';

data.Wwb = 2.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'ZhanLu2013';
  comment.Wwb = 'based on egg diameter of 3.63 mm: pi/6*0.363^3';
data.Wwj = 4.2;  units.Wwj = 'g';  label.Wwj = 'wet weight at metam';                bibkey.Wwj = 'guess';
  comment.Wwj = 'based on length-weight of Euphlyctis_cyanophlyctis: 31*(3.6/7)^3';
data.Wwp = 23.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females'; bibkey.Wwp = 'guess';
  comment.Wwi = 'based on length-weight of Euphlyctis_cyanophlyctis: 31*(6.4/7)^3';
data.Wwpm = 11.2; units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males'; bibkey.Wwpm = 'guess';
  comment.Wwpm = 'based on length-weight of Euphlyctis_cyanophlyctis: 12.5*(5.3/5.5)^3';
data.Wwi = 70.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Euphlyctis_cyanophlyctis: 31*(9.2/7)^3';
data.Wwim = 41.4; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Euphlyctis_cyanophlyctis: 12.5*(8.2/5.5)^3';

data.Ri  = 611/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';                bibkey.Ri  = 'ZhanLu2013';
  temp.Ri  = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '302 to 611 eggs per clutch, 1 clutch per yr assumed';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (yr), SVL (cm)
3.143	4.552
3.163	6.662
3.222	6.232
4.152	6.440
4.152	6.666
4.171	6.850
4.191	7.178
4.191	7.363
5.120	6.095
5.140	7.817
5.140	7.673
5.140	7.448
5.140	5.808
5.180	8.206
5.180	8.042
5.199	7.223
5.199	7.059
5.199	6.710
5.199	6.280
6.168	7.021
6.168	8.025
6.168	8.660
6.188	7.287
6.188	7.841
6.188	8.435
6.188	9.009
6.208	8.210
6.227	7.574
7.137	8.602
7.157	6.676
7.176	9.074
7.176	8.725
7.176	8.172
7.176	7.557
7.196	7.844
8.165	8.114
8.185	8.298
8.185	8.462
8.204	8.831
8.204	9.118
9.153	8.998
9.153	8.589
9.153	8.486
9.173	9.388
9.173	8.773
9.173	8.343
10.181	9.822];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f   = C2K(11);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'ZhanLu2013';
comment.tL_f = 'data for females';
%
data.tL_m = [ ... % time since metam (yr), SVL (cm)
1.720	4.895
2.768	5.698
2.787	5.903
2.827	6.190
3.756	6.623
3.756	6.480
3.756	5.537
3.796	6.849
3.796	6.378
3.835	6.050
4.764	7.447
4.764	7.119
4.784	6.975
4.784	6.750
4.784	6.524
5.753	7.593
5.753	7.245
5.753	6.979
5.753	6.692
5.753	6.425
6.761	7.207
6.761	7.003
6.781	7.556
6.781	7.392
6.801	6.736
7.789	7.764
7.809	7.600
7.809	7.416
8.758	7.194
8.758	7.972
8.778	7.768
8.817	7.419];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m   = C2K(11);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'ZhanLu2013';
comment.tL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% weights.psd.v = 3 * weights.psd.v;
% weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '45N7V'; % Cat of Life
metaData.links.id_ITIS = '774160'; % ITIS
metaData.links.id_EoL = '1039355'; % Ency of Life
metaData.links.id_Wiki = 'Nanorana_taihangnica'; % Wikipedia
metaData.links.id_ADW = 'Nanorana_taihangnica'; % ADW
metaData.links.id_Taxo = '989266'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Nanorana+taihangnica'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Nanorana_taihangnica}}';
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
bibkey = 'ZhanLu2013'; type = 'Article'; bib = [ ... 
'author = {Lixia Zhang and Youqiang Lu and Xin Lu and Xiaohong Chen}, ' ... 
'year = {2013}, ' ...
'title = {Age and growth examined by skeletochronology for the stream-dwelling frog \emph{Feirana taihangnicus} in central {C}hina}, ' ...
'journal = {Herpetological Journal}, ' ...
'volume = {23}, ' ...
'pages = {89-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Nanorana+taihangnica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

