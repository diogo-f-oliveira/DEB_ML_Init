function [data, auxData, metaData, txtData, weights] = mydata_Alaskozetes_antarcticus

%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Arachnida'; 
metaData.order      = 'Sarcoptiformes'; 
metaData.family     = 'Ameronothridae';
metaData.species    = 'Alaskozetes_antarcticus'; 
metaData.species_en = 'Oribatid mite'; 

metaData.ecoCode.climate = {'EF'};
metaData.ecoCode.ecozone = {'TS'};
metaData.ecoCode.habitat = {'0jTd'};
metaData.ecoCode.embryo  = {'Ts'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biH', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Wdb'; 'Wdj'; 'Wdp'; 'Wdi'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 't_Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 10 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc  = [2018 10 25]; 

%% set data
% zero-variate data

data.ab = 45;     units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'BlocConv1955';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '30 to 60 d';
data.tp = 5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BlocConv1955';
  temp.tp = C2K(0); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'guess';   
  temp.am = C2K(2); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wdb = 2;    units.Wdb = 'mug';    label.Wdb = 'dry weight at birth';      bibkey.Wdb = 'guess';   
data.Wdj = 3.6;  units.Wdj = 'mug';    label.Wdj = 'dry weight at metam';      bibkey.Wdj = 'Conv1994';   
data.Wdp = 52;   units.Wdp = 'mug';    label.Wdp = 'dry weight at puberty';    bibkey.Wdp = 'Conv1994';   
data.Wdi = 80;   units.Wdi = 'mug';    label.Wdi = 'ultimate dry weight';      bibkey.Wdi = 'Conv1994';   
data.Wwi = 180;  units.Wwi = 'mug';    label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'Conv1994';   

data.Ri  = 5/365;     units.Ri  = '#/d';   label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BlocConv1955';   
  temp.Ri = C2K(4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 6 eggs per individual, but also upto 14';
   
% univariate data
% time-weight: field data
data.tW_p = [ ... % time (d), dry weight (mug)
0.705	3.617
103.042	12.305
214.211	11.103
318.688	15.357
378.354	16.753];
units.tW_p   = {'d', 'mug'};  label.tW_p = {'time', 'dry weight', 'protonymph'};  
temp.tW_p    = C2K(3);  units.temp.tW_p = 'K'; label.temp.tW_p = 'temperature';
bibkey.tW_p  = 'Conv1994';
comment.tW_p = 'protonymphs; winter from day 100 to 320';
%
data.tW_d = [ ... % time (d), dry weight (mug)
2.052	6.736
102.130	31.263
215.309	24.569
318.138	26.044
378.860	38.738];
units.tW_d   = {'d', 'mug'};  label.tW_d = {'time', 'dry weight', 'deutonymph'};  
temp.tW_d    = C2K(3);  units.temp.tW_d = 'K'; label.temp.tW_d = 'temperature';
bibkey.tW_d  = 'BlocConv1955';
comment.tW_d = 'deutonymphs; winter from day 100 to 320';
%
data.tW_t = [ ... % time (d), dry weight (mug)
1.789	14.766
102.408	62.471
214.488	60.159
318.652	60.706
379.603	68.439];
units.tW_t   = {'d', 'mug'};  label.tW_t = {'time', 'dry weight', 'tritonymph'};  
temp.tW_t    = C2K(3);  units.temp.tW_t = 'K'; label.temp.tW_t = 'temperature';
bibkey.tW_t  = 'BlocConv1955';
comment.tW_t = 'tritonymphs; winter from day 100 to 320';
%
data.tW_a = [ ... % time (d), dry weight (mug)
3.529	52.446
103.761	81.733
215.126	69.472
318.148	72.146
377.872	83.832];
units.tW_a   = {'d', 'mug'};  label.tW_a = {'time', 'dry weight', 'adult'};  
temp.tW_a    = C2K(3);  units.temp.tW_a = 'K'; label.temp.tW_a = 'temperature';
bibkey.tW_a  = 'Conv1994';
comment.tW_a = 'adults; winter from day 100 to 320';

% time-weight: lab data
data.tWw_d02 = [ ... % time (d), fresh weight (mug)
3.568	26.188
42.710	48.453
81.453	51.828
118.331	68.982
147.021	80.225
186.665	87.242
228.120	98.640
264.119	104.887
296.508	98.742];
units.tWw_d02   = {'d', 'mug'};  label.tWw_d02 = {'time', 'wet weight', '2 C'};  
temp.tWw_d02    = C2K(2);  units.temp.tWw_d02 = 'K'; label.temp.tWw_d02 = 'temperature';
bibkey.tWw_d02  = 'Conv1994';
comment.tWw_d02 = 'deutonymphs; lab culture';
%
data.tWw_d07 = [ ... % time (d), fresh weight (mug)
2.643	30.535
42.686	56.443
81.411	65.629
117.353	90.761
148.296	110.749
187.473	121.392
227.520	145.848
265.385	138.316
296.763	164.846];
units.tWw_d07   = {'d', 'mug'};  label.tWw_d07 = {'time', 'wet weight', '7 C'};  
temp.tWw_d07    = C2K(7);  units.temp.tWw_d07 = 'K'; label.temp.tWw_d07 = 'temperature';
bibkey.tWw_d07  = 'Conv1994';
comment.tWw_d07 = 'deutonymphs; lab culture';
%
data.tWw_d12 = [ ... % time (d), fresh weight (mug)
2.663	23.998
44.545	44.844
81.918	48.928
117.917	55.175
149.360	60.640
188.086	69.826
229.109	73.228
264.205	76.559
296.548	85.667];
units.tWw_d12   = {'d', 'mug'};  label.tWw_d12 = {'time', 'wet weight', '12 C'};  
temp.tWw_d12    = C2K(12);  units.temp.tWw_d12 = 'K'; label.temp.tWw_d12 = 'temperature';
bibkey.tWw_d12  = 'Conv1994';
comment.tWw_d12 = 'deutonymphs; lab culture';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.tWw_d02 = 10 * weights.tWw_d02;
weights.tWw_d07 = 10 * weights.tWw_d07;
weights.tWw_d12 = 0 * weights.tWw_d12;
weights.Wwi = 10 * weights.Wwi;
weights.tp = 0 * weights.tp;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_a','tW_t','tW_d','tW_p'}; subtitle1 = {'Data for adults, trito-, deuto-, proto-nymphs'};
set2 = {'tWw_d12','tWw_d07','tWw_d02' }; subtitle2 = {'Data for deutonymphs at 12, 7, 2 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'cosinusoidal temperature profile assumed for field data: time t=365*(0:.025:1) (in d); temperature T = 15*cos((t-20)*2*pi/365)-5 (in C);';
D2 = 'the first 2 larval stage are assumed to accelerate; allocation to reproduction is assumed to start at adult stage';
D3 = 'feeding is assumed to cease below 0 C, to allow for shrinking during winter';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'Survives in freezing conditions with almost no humidity';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'One moult per yr, 5 post-embryo, pre-adult stages; reproduction in adult stage; the 2 larva stages are six-legged and only lightly sclerotized';
metaData.bibkey.F2 = 'BlocConv1955'; 
F3 = 'protonymph, deutonymph and tritonymph are eight-legged, more robust and resemble the adult more closel';
metaData.bibkey.F3 = 'BlocConv1955'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = 'BF74'; % Cat of Life
metaData.links.id_ITIS = '741099'; % ITIS
metaData.links.id_EoL = '588540'; % Ency of Life
metaData.links.id_Wiki = 'Alaskozetes_antarcticus'; % Wikipedia
metaData.links.id_ADW = 'Alaskozetes_antarcticus'; % ADW
metaData.links.id_Taxo = '1394187'; % Taxonomicon
metaData.links.id_WoRMS = '508284'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Alaskozetes_antarcticus}}';
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
bibkey = 'BlocConv1955'; type = 'Article'; bib = [ ... 
'author = {W. Block and P . Convey}, ' ... 
'year = {1955}, ' ...
'title = {The biology, life cycle and ecophysiology of the {A}ntarctic mite \emph{Alaskozetes antarcticus}}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {236}, ' ...
'pages = {431--449}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Conv1994'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1600-0587.1994.tb00081.x}, ' ...
'author = {P . Convey}, ' ... 
'year = {1994}, ' ...
'title = {Growth and survival strategy of the Antarctic mite \emph{Alaskozetes antarcticus}}, ' ...
'journal = {Ecography}, ' ...
'volume = {17}, ' ...
'pages = {97-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

