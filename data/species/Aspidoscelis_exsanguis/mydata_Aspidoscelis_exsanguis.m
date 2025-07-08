function [data, auxData, metaData, txtData, weights] = mydata_Aspidoscelis_exsanguis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Teiidae';
metaData.species    = 'Aspidoscelis_exsanguis'; 
metaData.species_en = 'Chihuahuan spotted whiptail'; 

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
data.Li  = 8.65;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'BateSnel2010';  

data.Wwi = 7.8;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Lacerta_agilis: (8.65/10)^3*12';

data.Ri  = 2.96/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'BateSnel2010';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2.96 egggs per cltch, 1 clutch per yr';
  
% univariate data
% t-L data
data.tL = [ ... % time since birth (month), SVL (cm)
0.880	3.710
0.913	5.216
0.913	5.032
0.913	4.861
0.913	3.637
0.946	4.702
0.946	3.539
0.978	4.555
0.978	3.404
0.978	3.270
1.043	4.029
1.891	5.436
1.924	4.861
1.924	5.559
1.957	5.375
1.957	4.677
1.957	4.469
2.022	4.959
2.022	5.069
2.022	4.274
2.054	5.779
6.848	6.980
6.880	8.412
6.913	7.604
6.913	5.646
6.946	8.216
6.978	7.347
7.043	6.148
7.891	7.164
7.891	7.079
7.891	7.996
7.924	7.274
7.924	7.764
7.924	7.874
7.957	7.690
7.957	8.192
7.957	8.363
8.935	8.694
8.935	8.131
8.935	7.997
8.935	7.850
8.935	7.642
8.967	7.519
14.870	8.195
15.880	8.195
15.880	8.685
15.880	8.807
15.880	9.125
15.913	6.617
16.924	8.526
16.924	9.004
22.859	8.639
22.891	7.880
22.989	8.431
23.870	8.541
23.902	8.370
23.935	9.006
24.978	8.505];
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
metaData.links.id_CoL = 'HHHJ'; % Cat of Life
metaData.links.id_ITIS = '174017'; % ITIS
metaData.links.id_EoL = '1056817'; % Ency of Life
metaData.links.id_Wiki = 'Aspidoscelis_exsanguis'; % Wikipedia
metaData.links.id_ADW = 'Aspidoscelis_exsanguis'; % ADW
metaData.links.id_Taxo = '744767'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Aspidoscelis&species=exsanguis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aspidoscelis_exsanguis}}';
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
