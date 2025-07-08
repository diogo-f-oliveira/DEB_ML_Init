function [data, auxData, metaData, txtData, weights] = mydata_Loxechinus_albus
%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Echinoidea'; 
metaData.order      = 'Camarodonta'; 
metaData.family     = 'Parechinidae';
metaData.species    = 'Loxechinus_albus'; 
metaData.species_en = 'Chilean sea urchin';

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa', 'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(11); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 22]; 

%% set data
% zero-variate data

data.am = 15*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(11);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.09;   units.Lj  = 'cm';  label.Lj  = 'length at metam';          bibkey.Lj  = 'guess';
  comment.Lj = 'based on Echinus_esculentus';
data.Lp  = 4.3;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty'; bibkey.Lp  = 'BalbMoli2018';
data.Li  = 11;    units.Li  = 'cm';  label.Li  = 'ultimate test diameter';  bibkey.Li  = 'Wiki';

data.Wwb = 5e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwj = 4.8e-4; units.Wwj = 'g';   label.Wwj = 'wet weight at puberty';    bibkey.Wwj = 'guess';
  comment.Wwj = 'based on 0.4943*Lj^2.877, see F1';
data.Wwp = 33;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BalbMoli2018','RobiGree2010'};
  comment.Wwp = 'based on 0.4943*Lp^2.877, see F1';
data.Wwi = 490;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = {'Wiki','RobiGree2010'};
  comment.Wwi = 'based on 0.4943*Li^2.877, see F1';

data.Ri  = 2e7/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';       bibkey.Ri  = 'guess';   
  temp.Ri = C2K(11);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.95';
 
% uni-variate data

% t-L data
data.tL = [ ... % time since settlement (yr), test diameter (cm)
2.082	2.859
2.082	4.011
2.097	3.186
2.097	3.320
3.071	3.646
3.071	3.704
3.071	3.780
3.071	3.876
3.071	3.876
3.086	2.610
3.086	2.898
3.086	3.550
3.086	3.953
3.101	3.339
3.101	3.435
3.101	3.454
3.101	4.183
3.101	4.375
3.116	3.109
3.116	3.224
3.116	4.107
4.075	3.109
4.075	3.416
4.075	3.608
4.075	3.761
4.090	3.876
4.090	5.028
4.090	5.200
4.090	5.488
4.090	5.603
4.090	5.680
4.090	5.910
4.105	4.030
4.105	4.529
5.064	5.853
5.064	5.968
5.064	6.122
5.064	6.217
5.079	4.644
5.079	5.776
5.094	3.915
5.094	4.299
5.109	4.778
5.109	4.836
5.109	4.970
5.109	5.104
5.109	5.181
5.109	5.296
5.109	5.354
5.109	5.450
5.109	5.527
5.109	5.584
5.109	5.680
6.082	5.469
6.082	5.546
6.082	5.680
6.082	5.738
6.082	5.853
6.082	5.930
6.082	6.064
6.082	6.141
6.082	6.217
6.082	6.275
6.082	6.333
6.082	6.525
6.097	4.874
6.097	5.047
6.097	5.239
6.097	5.335
6.097	6.832
6.097	7.215
7.056	6.448
7.071	6.275
7.071	6.275
7.071	6.409
7.071	6.525
7.071	6.985
7.071	7.580
7.086	4.567
7.086	5.181
7.086	5.431
7.086	5.680
7.086	5.872
7.086	6.026
7.086	6.198
7.086	6.851
7.101	6.678
7.101	6.755
8.060	7.906
8.075	6.601
8.075	6.736
8.075	6.870
8.075	6.908
8.075	6.985
8.075	7.023
8.075	7.081
8.075	7.177
8.075	7.330
8.090	5.834
8.090	6.064
9.079	7.119
9.094	7.023
10.097	7.580
10.097	8.981];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d = 
units.tL   = {'d', 'cm'};  label.tL = {'time since settlement', 'test diameter'};  
temp.tL    = C2K(11);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BalbMoli2018';
comment.tL = 'Data from Picuta';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length for Psammechinus_miliaris: log10(W in g) = -3.183 + 2.877 * log10(diameter in mm), so W in g = 0.4943 * (diameter in cm)^2.877';
metaData.bibkey.F1 = 'RobiGree2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3W8W9'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3039402'; % Ency of Life
metaData.links.id_Wiki = 'Loxechinus_albus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '152649'; % Taxonomicon
metaData.links.id_WoRMS = '160809'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Loxechinus_albus}}';
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
bibkey = 'BalbMoli2018'; type = 'Article'; bib = [ ... 
'author = {Cecilia Balboa and Carlos Molinet and Nancy Barahona and Patricio A. D\''{i}az and Dagoberto Subiabre and Paulina Gebauer}, ' ... 
'year = {2018}, ' ...
'title = {Using growth ring formation to study growth patterns of exploited sea urchin (\emph{Loxechinus albus}) populations}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {201}, ' ...
'pages = {88-97}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobiGree2010'; type = 'Article'; bib = [ ... 
'author = {L. A. Robinson and S. P. R. Greenstreet and H. Reiss and R. Callaway and J. Craeymeersch and I. de Boois and S. Degraer and S. Ehrich and H. M. Fraser and A. Goffin and I. Kroncke and L. Jorgenson and M. R. Robertson and J. Lancaster}, ' ... 
'year = {2010}, ' ...
'title = {Length-weight relationships of 216 {N}orth {S}ea benthic invertebrates and fish}, ' ...
'journal = {J. Mar. Bio. Assoc. UK}, ' ...
'volume = {90}, ' ...
'pages = {95-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

