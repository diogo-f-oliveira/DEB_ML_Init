function [data, auxData, metaData, txtData, weights] = mydata_Sylvirana_nigrovittata
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Pelobatidae';
metaData.species    = 'Sylvirana_nigrovittata'; 
metaData.species_en = 'Black-striped frog'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females'; bibkey.tp = 'guess';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'KhonMats2000';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'temp 11-34 C';

data.Li  = 5.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'KhonMats2000';
  comment.Li = 'based on tL_f data';
data.Lim = 6.5;  units.Lim  = 'cm'; label.Lim = 'ultimate SVL for males';     bibkey.Lim  = 'KhonMats2000';
  comment.Lim = 'based on tL_m data';

data.Wwb = 4.2e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Shah2016';
  comment.Wwb = 'based on egg diameter 0.9-1.1 mm: pi/6*0.1^3';
data.Wwi = 15.65; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Pelophylax lessonae: (5.5/7.6)^3*41.3';
data.Wwim = 25.8;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'guess';
  comment.Wwim = 'based on Pelophylax lessonae: (6.5/7.6)^3*41.3';

data.Ri  = 553/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Shah2016';   
  temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since metam (d), SVL (cm)
0.292	2.970
0.293	2.551
0.386	3.140
0.516	3.049
0.694	2.653
0.764	3.151
0.800	3.230
0.802	2.336
0.813	2.494
0.814	2.234
0.824	2.789
0.907	2.653
1.367	3.332
1.674	3.502
1.697	4.023
1.710	3.615
1.767	4.272
1.769	3.468
2.465	4.158
2.477	4.555
2.489	3.977
2.702	4.362
2.772	4.464
2.784	4.419
2.795	4.781
2.796	4.238
2.985	4.509
3.009	4.396
3.009	4.328
3.683	4.645
3.977	5.109
3.978	4.974
3.978	4.917
3.978	4.781
4.072	5.042
4.876	5.189
4.876	5.075
4.970	5.370
4.983	5.064
5.680	5.381];
data.tL_f(:,1) = (data.tL_f(:,1) + 0.8) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'females'};  
temp.tL_f    = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'KhonMats2000'; 
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since metam (d), SVL (cm)
0.482	2.415
0.495	1.611
0.669	3.389
0.669	3.332
0.670	3.253
0.670	3.196
0.681	3.717
0.681	3.626
0.787	3.491
0.788	3.377
0.882	3.570
0.907	2.925
1.378	3.921
1.696	4.555
1.697	4.113
1.898	3.943
2.015	4.657
2.109	4.781
2.689	4.781
2.783	5.200
2.783	4.962
2.783	4.826
2.973	4.623
2.984	5.177
2.984	5.075
2.984	4.996
2.984	4.917
3.103	4.962
3.694	5.053
3.977	5.506
3.977	5.426
4.391	5.336
4.758	5.211
4.852	5.574
4.875	5.653
4.876	5.336
4.970	5.642
5.786	5.460
7.475	6.660
7.665	6.275
7.972	6.547
8.787	6.819];
data.tL_m(:,1) = (data.tL_m(:,1)+0.8) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'males'};  
temp.tL_m    = C2K(25);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'KhonMats2000'; 
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

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
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '7B6QX'; % Cat of Life
metaData.links.id_ITIS = '1101755'; % ITIS
metaData.links.id_EoL = '46350290'; % Ency of Life
metaData.links.id_Wiki = 'Sylvirana_nigrovittata'; % Wikipedia
metaData.links.id_ADW = 'Rana_nigrovittata'; % ADW
metaData.links.id_Taxo = '996665'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Sylvirana+nigrovittata'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sylvirana_nigrovittata}}';
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
bibkey = 'KhonMats2000'; type = 'Article'; bib = [ ... 
'author = {Wichase Khonsue and Masafumi Matsui and Yasuchika Misawa}, ' ... 
'year = {2000}, ' ...
'title = {Age Determination by Skeletochronology of \emph{Rana nigrovittata}, a Frog from Tropical Forest of {T}hailand}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {17}, ' ...
'pages = {253–257}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Shah2016'; type = 'Article'; bib = [ ... 
'author = {Shahriza Shahrudin}, ' ... 
'year = {2016}, ' ...
'title = {Reproductive biology of \emph{Sylvirana nigrovittata} ({B}lyth, 1856) ({A}nura, {R}anidae) from {K}edah, {P}eninsular {M}alaysia}, ' ...
'journal = {The Herpetological Bulletin}, ' ...
'volume = {138}, ' ...
'pages = {38-39}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Sylvirana+nigrovittata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
