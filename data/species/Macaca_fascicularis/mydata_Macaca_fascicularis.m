function [data, auxData, metaData, txtData, weights] = mydata_Macaca_fascicularis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Primates'; 
metaData.family     = 'Cercopithecidae';
metaData.species    = 'Macaca_fascicularis'; 
metaData.species_en = 'Long-tailed macaque'; 

metaData.ecoCode.climate = {'Af', 'Am'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf', '0iTg', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.6); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 02 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 14];

%% set data
% zero-variate data

data.tg = 165;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.6);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 242;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.6);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1238;   units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.6);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1544;   units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(37.6);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 39*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 320;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 848.4;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 6393;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 1/431; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% time-weight
data.tW_f = [ ... % time since birth (yr), weight (kg)
0.844	2.442
1.378	2.797
1.467	2.443
1.467	2.572
2.400	3.023
2.422	3.601
2.444	3.826
2.978	4.004
3.467	6.542
3.511	5.386
4.044	4.808
6.956	5.825
6.956	6.226
6.978	5.986
7.956	8.139
7.978	7.256
8.978	7.820];
data.tW_f(:,1) = data.tW_f(:,1) * 365.25; % convert yr to d
data.tW_f(:,2) = data.tW_f(:,2) * 1e3; % convert kg to g
units.tW_f   = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f    = C2K(37.6);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'SchiJone2007';
comment.tW_f = 'Data for females from Thailand';
%
data.tW_m = [ ... % time since birth (yr), weight (kg)
1.589	2.678
1.610	2.926
2.542	4.163
2.606	3.374
2.627	2.811
2.627	3.036
3.114	5.108
3.220	6.099
3.242	6.392
3.263	3.868
3.263	4.206
3.284	4.567
3.284	4.747
3.856	8.058
4.449	9.611
4.449	7.538
4.470	5.420
6.271	8.796
7.373	11.295
7.394	8.793
8.369	9.828
9.386	9.420
9.386	7.798
9.386	13.025];
data.tW_m(:,1) = data.tW_m(:,1) * 365.25; % convert yr to d
data.tW_m(:,2) = data.tW_m(:,2) * 1e3; % convert kg to g
units.tW_m   = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m    = C2K(37.6);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'SchiJone2007';
comment.tW_m = 'Data for males from Thailand';
%
data.tW1_f = [ ... % time since birth (yr), weight (kg)
0.311	0.948
0.800	2.201
0.822	1.190
0.822	1.527
1.378	1.512
1.400	1.608
1.400	1.769
1.400	2.235
1.467	2.058
1.511	1.865
1.511	1.994
2.400	2.654
2.933	2.831
2.956	3.313
2.978	2.606
3.467	3.491
3.489	3.153
3.489	3.314
4.111	3.540
5.844	3.848
5.956	3.671
5.956	3.446
6.000	4.635
6.978	3.833
6.978	3.047
7.378	2.967
7.422	3.545
7.467	3.208
8.000	3.835
8.933	4.061];
data.tW1_f(:,1) = data.tW1_f(:,1) * 365.25; % convert yr to d
data.tW1_f(:,2) = data.tW1_f(:,2) * 1e3; % convert kg to g
units.tW1_f   = {'d', 'g'};  label.tW1_f = {'time since birth', 'weight', 'female'};  
temp.tW1_f    = C2K(37.6);  units.temp.tW1_f = 'K'; label.temp.tW1_f = 'temperature';
bibkey.tW1_f = 'SchiJone2007';
comment.tW1_f = 'Data for females from Signapore';
% 
data.tW1_m = [ ... % time since birth (yr), weight (kg)
0.148	0.563
0.805	1.012
0.805	1.237
0.826	1.575
0.826	1.688
0.826	2.049
0.826	2.792
1.525	1.056
1.525	1.912
1.547	1.664
1.568	2.092
1.589	3.128
1.653	1.596
1.653	2.227
1.653	2.362
1.653	2.565
1.674	1.821
2.542	2.022
3.199	3.035
3.199	3.846
3.856	3.236
3.877	3.664
6.314	4.244
6.356	5.484
7.352	4.535
7.352	5.233
7.373	6.180
7.860	4.421
8.326	5.209
8.326	6.020
8.369	4.014
8.369	4.826
8.877	5.591];
data.tW1_m(:,1) = data.tW1_m(:,1) * 365.25; % convert yr to d
data.tW1_m(:,2) = data.tW1_m(:,2) * 1e3; % convert kg to g
units.tW1_m   = {'d', 'g'};  label.tW1_m = {'time since birth', 'weight', 'male'};  
temp.tW1_m    = C2K(37.6);  units.temp.tW1_m = 'K'; label.temp.tW1_m = 'temperature';
bibkey.tW1_m = 'SchiJone2007';
comment.tW1_m = 'Data for males from Signapore';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males in Thailand'};
set2 = {'tW1_f','tW1_m'}; subtitle2 = {'Data for females, males in Signapore'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '3WWND'; % Cat of Life
metaData.links.id_ITIS = '180098'; % ITIS
metaData.links.id_EoL = '327959'; % Ency of Life
metaData.links.id_Wiki = 'Macaca_fascicularis'; % Wikipedia
metaData.links.id_ADW = 'Macaca_fascicularis'; % ADW
metaData.links.id_Taxo = '168592'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12100534'; % MSW3
metaData.links.id_AnAge = 'Macaca_fascicularis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Macaca_fascicularis}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Macaca_fascicularis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Macaca_fascicularis/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SchiJone2007'; type = 'Article'; bib = [ ... 
'author = {M. A. Schillaci and L. Jones-Engel and B. P. Y.-H. Lee and A. Fuentes and N. Aggimarangsee and G. A. Engel and T. Sutthipa}, ' ... 
'year = {2007}, ' ...
'title = {Morphology and somatometric growth of long-tailed macaques (\emph{Macaca fascicularis fascicularis}) in {S}ingapore}, ' ...
'journal = {Biological Journal of the Linnean Society}, ' ...
'volume = {92}, ' ...
'pages = {675-694}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

