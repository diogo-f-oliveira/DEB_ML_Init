function [data, auxData, metaData, txtData, weights] = mydata_Amolops_mantzorum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Amolops_mantzorum'; 
metaData.species_en = 'Sichuan torrent frog'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTi'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 27];

%% set data
% zero-variate data

data.ab = 12;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(6.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'LiaoLu2010';
  temp.tp = C2K(6.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 365;units.tpm = 'd';   label.tpm = 'time since metam at puberty for males'; bibkey.tpm = 'LiaoLu2010';
  temp.tpm = C2K(6.5); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'LiaoLu2010';   
  temp.am = C2K(6.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.43;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';    bibkey.Lj  = 'guess'; 
  comment.Lj = 'based on Pelophylax_esculentus 1.9*7.15/9.5';
data.Li  = 7.15;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'LiaoLu2010';
data.Lim = 5.66;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL';  bibkey.Lim  = 'LiaoLu2010';

data.Wwb = 4.2e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 2 mm of Pelophylax_esculentus: pi/6*0.2^3';
data.Wwi = 37.3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax_esculentus (7.15/9.5)^3*87.5';
data.Wwim = 18.5; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Pelophylax_esculentus (5.66/9.5)^3*87.5';

data.Ri = 3730/365/2.32; units.Ri = '#/d';    label.Ri = 'max reproduction rate';     bibkey.Ri = 'guess';   
  temp.Ri = C2K(6.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Pelophylax_esculentus, weight and temp corrected: 8000*37.3/80 eggs per clutch at 15 C';

% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.278	1.932
2.980	6.645
2.980	6.574
2.980	6.398
3.990	6.409
3.990	6.680
3.990	7.270
4.003	7.187
4.003	6.963
4.003	6.716
4.975	7.175
4.975	7.069
4.975	7.010
4.975	6.834
4.975	6.692
4.987	6.551
5.972	7.105
5.972	7.069
5.997	6.857
5.997	6.669
6.010	7.293
6.010	7.175
6.970	7.387
6.970	7.317
6.970	7.246
6.970	7.199
6.970	6.963
6.982	6.739
7.980	7.305
7.992	7.199
8.990	7.729];
data.tL_f(:,1) = (data.tL_f(:,1) + 0) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since metam', 'SVL', 'female'};  
temp.tL_f    = C2K(6.5);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LiaoLu2010';
comment.tL_f = 'Data for females from Fengtongzhai National Nature Reserve, western Sichuan, China; temp 5.9-7.2 C';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.290	1.944
1.957	5.066
1.957	4.960
1.970	4.748
2.955	5.490
2.955	5.384
2.967	5.644
2.967	5.231
2.967	5.125
2.967	5.019
3.965	5.172
3.977	5.691
3.977	5.585
3.977	5.490
3.990	5.325
4.962	5.785
4.962	5.443
4.962	5.314
4.975	5.691
4.975	5.596
5.972	5.761
5.972	5.655
5.972	5.573
5.985	5.879
6.010	5.985
6.010	5.314
6.970	5.761
6.970	5.973
6.995	5.573];
data.tL_m(:,1) = (data.tL_m(:,1) + 0) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since metam', 'SVL', 'male'};  
temp.tL_m    = C2K(6.5);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LiaoLu2010';
comment.tL_m = 'Data for males from Fengtongzhai National Nature Reserve, western Sichuan, China; temp 5.9-7.2 C';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lj = 50 * weights.Lj;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '66DZP'; % Cat of Life
metaData.links.id_ITIS = '664907'; % ITIS
metaData.links.id_EoL = '1019786'; % Ency of Life
metaData.links.id_Wiki = 'Amolops_mantzorum'; % Wikipedia
metaData.links.id_ADW = 'Amolops_mantzorum'; % ADW
metaData.links.id_Taxo = '143359'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Amolops+mantzorum'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amolops_mantzorum}}';
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
bibkey = 'LiaoLu2010'; type = 'Article'; bib = [ ... 
'doi = {10.1670/08-104.1}, ' ...
'author = {Liao, Wen Bo and Lu, Xin}, ' ... 
'year = {2010}, ' ...
'title = {Age and Growth of a Subtropical High-Elevation Torrent Frog, \emph{Amolops mantzorum}, in Western {C}hina}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {44(1)}, ' ...
'pages = {172–176}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Amolops+mantzorum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
