function [data, auxData, metaData, txtData, weights] = mydata_Gerrhosaurus_skoogi
%% set metadata
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Gerrhosauridae';
metaData.species    = 'Gerrhosaurus_skoogi';
metaData.species_en = 'Desert plated lizard';

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTd', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(30); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Ri'}; 
metaData.data_1     = {'t-L', 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 30];

%% set data
% zero-variate data;
data.ab = 104.5;     units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'guess';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 2*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ChinHanr1995';
  temp.tp = C2K(30); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ChinHanr1995';
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 4.9;     units.Lb  = 'cm';   label.Lb  = 'snout to vent length at birth';    bibkey.Lb  = 'ChinHanr1995';
data.Li  = 15;     units.Li  = 'cm';   label.Li  = 'ultimate snout to vent length';    bibkey.Li  = 'ChinHanr1995';
  comment.Li = 'based on tL data';

data.Ri  = 4/365;    units.Ri  = '#/d';  label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';
temp.Ri = C2K(30);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_fm = [ ... % time since birth (d), SVL (cm)
1	10.669 8.599
1   NaN    5.138
1   NaN    9.990
1   NaN    7.596
2	11.581 NaN
2	11.031 NaN
2	12.422 NaN
3	13.108 8.257
3	12.785 NaN
3	13.755 NaN
3	12.106 NaN
3	11.750 NaN
4	13.244 NaN
4	12.306 NaN
4	13.794 NaN
4	13.503 NaN
5	13.768 15.061
5	12.959 16.420
5   NaN    12.506
5   NaN    14.447
6	13.095 14.098
6   NaN    15.586
7   NaN    14.525
10  14.124 NaN];  
data.tL_fm(:,1) = (data.tL_fm(:,1) + 0.5) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};     label.tL_fm = {'age', 'SVL'};  
temp.tL_fm   = C2K(30);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'ChinHanr1995'; treat.tL_fm = {1, {'females','males'}};

% time-weight
data.tW_fm = [ ... % time since birth (d), weight (g)
1	28.943 24.309
1   NaN    17.358
2	49.024 38.211
2	46.192 30.745
2	34.864 NaN
3	60.867 21.734
3	43.360 NaN
3	40.528 NaN
3	69.621 NaN
3	50.827 NaN
4	62.669 82.751
4	46.707 78.889
4	41.043 69.106
4	59.322 NaN
5	64.472 59.837
5   NaN    51.856
5   NaN    76.057
5   NaN    80.949
5   NaN    98.970
6	61.897 71.165
6   NaN    98.970
7   NaN    83.266
7   NaN    89.702
10	74.255 NaN];    
data.tW_fm(:,1) = (data.tW_fm(:,1) + 0.5) * 365; % convert yr to d
units.tW_fm = {'d', 'g'};     label.tW_fm = {'age', 'weight'};  
temp.tW_fm   = C2K(30);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'ChinHanr1995'; treat.tW_fm = {1, {'females','males'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 3 * weights.tL_fm;
weights.tW_fm = 3 * weights.tW_fm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'SL = 0.37*TL';
metaData.bibkey.F1 = 'BoycMorg1988'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3FX89'; % Cat of Life
metaData.links.id_ITIS = '1141818'; % ITIS
metaData.links.id_EoL = '795922'; % Ency of Life
metaData.links.id_Wiki = 'Gerrhosaurus_skoogi'; % Wikipedia
metaData.links.id_ADW = 'Gerrhosaurus_skoogi'; % ADW
metaData.links.id_Taxo = '642256'; % Taxonomicon
metaData.links.id_ReptileDB = 'genus=Gerrhosaurus&species=skoogi'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Gerrhosaurus_skoogi}}';  
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
bibkey = 'ChinHanr1995'; type = 'Article'; bib = [ ...
'author = {Anusuya Chinsamy and Shirley A. Hanrahan and Rosalind M. Neto and Mary Seely}, ' ...
'title = {Skeletochronological Assessment of Age in \emph{Angolosaurus skoogi}, a Cordylid Lizard Living in an Aseasonal Environment}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {29(3)}, ' ...
'pages = {457-460}, ' ...
'year = {1995}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


