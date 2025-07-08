function [data, auxData, metaData, txtData, weights] = mydata_Aspidoscelis_neomexicana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Teiidae';
metaData.species    = 'Aspidoscelis_neomexicana'; 
metaData.species_en = 'New Mexico whiptail';

metaData.ecoCode.climate = {'BSk', 'BWk', 'BWh'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 16];

%% set data
% zero-variate data

data.tp = 14*30.5;     units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'BateSnel2010';
  temp.tp = C2K(22); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'BateSnel2010';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.0;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'BateSnel2010';  
data.Li  = 7.73;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'BateSnel2010';  

data.Wwi = 5.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet  weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Lacerta_agilis: (7.73/10)^3*12';

data.Ri  = 1.2*2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'BateSnel2010';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 egggs per cltch, 1 to 2 clutches per yr';

% univariate data
% t-L data
data.tL = [ ... % time since birth (month), SVL (cm)
0.880	4.861
0.880	4.261
0.913	4.175
0.978	4.653
0.978	3.404
0.978	3.355
0.978	3.331
1.011	3.527
1.011	3.490
1.076	3.943
1.109	3.784
1.109	3.686
1.109	3.612
1.957	4.188
1.957	4.274
1.957	4.359
1.957	4.408
1.957	4.469
1.957	4.580
1.957	4.677
1.989	3.344
1.989	3.417
1.989	3.527
1.989	3.588
1.989	3.674
1.989	3.809
1.989	3.882
1.989	4.090
2.022	3.184
6.815	5.744
6.913	6.393
6.913	6.197
6.946	7.531
6.946	7.751
6.978	7.262
6.978	5.463
6.978	4.826
7.043	6.882
7.043	6.625
7.043	5.255
7.043	5.108
7.924	5.928
7.957	6.675
7.957	6.809
7.957	6.895
7.957	7.017
7.957	7.091
7.989	6.038
7.989	6.467
9.033	6.969
9.033	6.883
9.033	6.749
9.033	6.553
9.033	6.259
9.033	6.112
9.033	5.965
15.033	7.314
15.033	7.118
15.880	7.057
15.946	7.657
16.011	6.910
16.011	7.510
16.043	7.216
16.043	7.412
16.989	7.058
17.022	7.290
22.957	8.002
23.967	7.660];
data.tL(:,1) = data.tL(:,1) * 30.5; % convert month to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BateSnel2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Parthenogenic species';
metaData.bibkey.F1 = 'BateSnel2010'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'HHJ8'; % Cat of Life
metaData.links.id_ITIS = '174024'; % ITIS
metaData.links.id_EoL = '1056798'; % Ency of Life
metaData.links.id_Wiki = 'Aspidoscelis_neomexicana'; % Wikipedia
metaData.links.id_ADW = 'Aspidoscelis_neomexicana'; % ADW
metaData.links.id_Taxo = '744774'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Aspidoscelis&species=neomexicana'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aspidoscelis_neomexicana}}';
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
bibkey = 'BateSnel2010'; type = 'Article'; bib = [ ... 
'author = {Heather L. Bateman and Howard L. Snell and Alice Chung-Maccoubrey and Deborah M. Finch}, ' ... 
'year = {2010}, ' ...
'title = {Growth, Activity, and Survivorship from Three Sympatric Parthenogenic Whiptails (Family {T}eiidae)}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {44}, ' ...
'pages = {301-306}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
