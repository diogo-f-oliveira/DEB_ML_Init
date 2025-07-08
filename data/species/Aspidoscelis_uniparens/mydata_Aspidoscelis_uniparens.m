function [data, auxData, metaData, txtData, weights] = mydata_Aspidoscelis_uniparens

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Teiidae';
metaData.species    = 'Aspidoscelis_uniparens'; 
metaData.species_en = 'Desert grassland whiptail lizard'; 

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
data.Li  = 7.55;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';         bibkey.Li  = 'BateSnel2010';  

data.Wwi = 5.2;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Lacerta_agilis: (7.55/10)^3*12';

data.Ri  = 2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data
% t-L data
data.tL = [ ... % time since birth (month), SVL (cm)
0.783	2.964
0.848	3.062
0.848	3.698
0.946	3.184
0.946	3.355
0.946	3.392
0.946	3.466
0.946	3.527
0.946	3.563
1.891	3.625
1.891	3.686
1.891	3.784
1.891	3.870
1.891	3.980
1.924	3.221
1.924	3.393
1.924	3.466
1.924	3.552
2.022	3.001
7.011	4.741
7.011	4.985
7.826	4.900
7.891	4.741
7.989	4.545
7.989	4.643
8.022	4.386
16.891	5.993
16.891	6.617
22.859	7.011
22.957	6.864
23.935	7.232
24.880	7.122
24.880	7.012];
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
metaData.links.id_CoL = 'HHJQ'; % Cat of Life
metaData.links.id_ITIS = '208947'; % ITIS
metaData.links.id_EoL = '454775'; % Ency of Life
metaData.links.id_Wiki = 'Aspidoscelis_uniparens'; % Wikipedia
metaData.links.id_ADW = 'Aspidoscelis_uniparens'; % ADW
metaData.links.id_Taxo = '744782'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Aspidoscelis&species=uniparens'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aspidoscelis_uniparens}}';
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
