function [data, auxData, metaData, txtData, weights] = mydata_Pelophylax_perezi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Pelophylax_perezi'; 
metaData.species_en = 'Iberian waterfrog'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTh'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 15];

%% set data
% zero-variate data

data.ab = 6;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'AnAge';   
  temp.ab = C2K(26);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 70; units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'AnAge';
  temp.tj = C2K(28);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'EsteGarc1996';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.8*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 2.0;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'EsteGarc1996';
  comment.Lj = '1.7-2.2 cm';
data.Lp  = 5.4;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'EsteGarc1996';
data.Lpm  = 4.3;  units.Lpm  = 'cm'; label.Lpm  = 'SVL at puberty for males';  bibkey.Lpm  = 'EsteGarc1996';
data.Li  = 8.6;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'EsteGarc1996';
data.Lim = 5.8;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL';           bibkey.Lim  = 'EsteGarc1996';  

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwj = 0.82;  units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'guess';
  comment.Wwj = 'based on (Lj/Li)^3*Wwi';
data.Wwp = 16;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'guess';
  comment.Wwj = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 64.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_esculentus (8.6/9.5)^3*87.5';

data.Ri = 5e3/365; units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pelophylax_esculentus';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since metam (d), SVL (cm)
1	2.592 4.337
1	3.698 4.200
1	3.756 4.086
1	3.071 3.995
1	2.775 1.771
1	2.969 3.733
1	4.029 2.604
1	4.372 2.558
1	4.189 2.090
1	NaN   1.988
1	NaN   3.402
1	NaN   3.277
1	NaN   3.117
1	NaN   2.934
1	NaN   2.786
1	NaN   2.410
1	NaN   2.273
1	NaN   2.182
2	5.530 4.755
2	5.416 4.470
2	5.336 5.838
2	5.291 5.108
2	5.245 5.188
2	5.188 5.314
2	5.063 5.496
2	5.645 4.857
3	6.598 5.115
3	6.735 5.309
3	6.507 5.480
3	6.415 5.765
3	6.199 NaN
4	7.038 5.738
4	6.958 5.875
4	6.901 5.122
4	6.856 NaN
4	6.810 NaN
4	6.628 NaN
4	6.206 NaN
4	6.080 NaN
5	7.729 NaN
5	7.250 NaN
5	7.684 NaN
5	7.102 NaN
6	8.626 NaN];
data.tL_fm(:,1) = (data.tL_fm(:,1) + .8) * 365; % convert yr to d
units.tL_fm   = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm    = C2K(15);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'EsteGarc1996'; treat.tL_fm = {1, {'females','males'}};
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '76CHM'; % Cat of Life
metaData.links.id_ITIS = '775192'; % ITIS
metaData.links.id_EoL = '62666670'; % Ency of Life
metaData.links.id_Wiki = 'Pelophylax_perezi'; % Wikipedia
metaData.links.id_ADW = 'Pelophylax_perezi'; % ADW
metaData.links.id_Taxo = '996610'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Pelophylax+perezi'; % AmphibiaWeb
metaData.links.id_AnAge = 'Pelophylax_perezi'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelophylax_perezi}}';
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
bibkey = 'EsteGarc1996'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z96-216}, ' ...
'author = {Esteban, M. and García-París, M. and Castanet, J.}, ' ... 
'year = {1996}, ' ...
'title = {Use of bone histology in estimating the age of frogs (\emph{Rana perezi}) from a warm temperate climate area}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {74(10)}, ' ...
'pages = {1914–1921}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Pelophylax_perezi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
