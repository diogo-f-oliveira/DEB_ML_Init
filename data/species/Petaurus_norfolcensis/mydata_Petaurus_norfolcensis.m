function [data, auxData, metaData, txtData, weights] = mydata_Petaurus_norfolcensis
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Diprotodontia'; 
metaData.family     = 'Petauridae';
metaData.species    = 'Petaurus_norfolcensis'; 
metaData.species_en = 'Squirrel glider'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh', '0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 07]; 

%% set data
% zero-variate data

data.tg = 20;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Wiki: 58 d';
data.tx = 122;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 400;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 14.8*365;    units.am = 'd';      label.am = 'life span';          bibkey.am = 'AnAge';   
  temp.am = C2K(35.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.333; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'AnAge';
data.Wwx = 118; units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';    bibkey.Wwx = 'AnAge';
data.Wwi = 405;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'AnAge';

data.Ri  = 2*1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2 litters per yr; 1.5 pup per litter';

% univariate data

% time-weight
data.tWw = [ ...
4.082	2.406
5.917	2.390
27.119	2.615
28.955	3.006
46.496	7.734
48.128	8.126
53.639	11.331
68.541	21.366
75.289	31.065
81.837	43.204
90.025	59.800
96.367	70.315
103.328	84.890
110.493	99.869
117.435	105.094
124.593	116.009
130.545	135.876
138.717	144.343
145.666	152.820
154.248	162.909
159.348	164.492
168.536	171.324
180.379	180.572];
units.tWw  = {'d', 'g'};  label.tWw = {'time', 'weight'};  
temp.tWw  = C2K(35.9);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Smit1979';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 50 * weights.tWw;
weights.Wwx = 0 * weights.Wwx;

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4FD5L'; % Cat of Life
metaData.links.id_ITIS = '609843'; % ITIS
metaData.links.id_EoL = '323827'; % Ency of Life
metaData.links.id_Wiki = 'Petaurus_norfolcensis'; % Wikipedia
metaData.links.id_ADW = 'Petaurus_norfolcensis'; % ADW
metaData.links.id_Taxo = '60225'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '11000163'; % MSW3
metaData.links.id_AnAge = 'Petaurus_norfolcensis'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Petaurus_norfolcensis}}';
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
bibkey = 'Smit1979'; type = 'Article'; bib = [ ... 
'doi = {10.1071/wr9790141}, ' ...
'author = {Smith, M.}, ' ... 
'year = {1979}, ' ...
'title = {Observations on Growth of Petaurus Breviceps and P. Norfolcensis (Petauridae : Marsupialia) in Captivity}, ' ...
'journal = {Wildlife Research}, ' ...
'volume = {6(2)}, ' ...
'pages = {141-150}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Petaurus_norfolcensis}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

