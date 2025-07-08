function [data, auxData, metaData, txtData, weights] = mydata_Scomberesox_saurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Scomberesocidae';
metaData.species    = 'Scomberesox_saurus'; 
metaData.species_en = 'Atlantic saury';

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MA'};
metaData.ecoCode.habitat = {'biMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 01 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2022 12 04];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2022 12 04]; 

%% set data
% zero-variate data

data.ab = 3;     units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 2*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 0.8;   units.Lb = 'cm';   label.Lb = 'total length at birth'; bibkey.Lb = 'Brow1983';
data.Lp  = 26.5; units.Lp  = 'cm'; label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 50;     units.Li  = 'cm'; label.Li  = 'ultimate total length';  bibkey.Li  = 'Wiki';

data.Wwi = 411;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00214*Li^3.11, see F1';
 
data.Ri  = 32e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.95';

% uni-variate data
% time-length data
data.tL = [ ... % time since hatch (d), total length (cm) 
107.619	11.020
113.714	11.983
122.857	14.306
123.619	12.493
124.762	13.853
125.905	13.059
126.286	14.363
127.048	11.926
129.714	11.643
130.857	13.003
134.286	18.669
134.667	12.776
136.571	13.343
141.905	14.759
147.238	13.626
147.238	13.966
148.381	21.331
149.905	19.008
151.810	14.136
151.810	14.986
154.476	19.915
154.857	20.652
155.619	16.459
158.667	19.632
159.429	15.666
162.476	15.892
163.619	17.762
164.381	20.028
165.524	18.499
171.619	16.572
171.619	17.025
173.524	18.329
174.286	17.479
174.667	17.025
175.048	20.878
177.714	21.558
180.000	16.006
180.762	19.292
180.762	15.212
182.667	17.989
185.333	17.195
186.095	20.708
186.857	23.201
186.857	23.824
191.429	25.581
191.810	23.031
194.857	22.521
200.190	23.371
202.095	25.071
202.857	21.105
204.762	24.108
208.190	19.915
208.571	24.731
208.952	22.011
213.905	17.649
214.286	19.348
214.667	24.958
215.810	22.351
219.238	27.224
220.381	22.975
229.143	25.297
229.524	20.198
234.095	25.071
235.619	28.130
237.905	24.334
242.095	24.561
252.381	23.031];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL  = C2K(14); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AqueBrop2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
D2 = 'Fast growth gives high maintenance estimate, but depends on the assumption that an otolith micro-increment corresponds with a day';
D3 = 'mod_1: p_M is reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: W in g = 0.00214*(TL in cm)^3.11';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4VTVV'; % Cat of Life
metaData.links.id_ITIS = '165612'; % ITIS
metaData.links.id_EoL = '993264'; % Ency of Life
metaData.links.id_Wiki = 'Scomberesox_saurus'; % Wikipedia
metaData.links.id_ADW = 'Scomberesox_saurus'; % ADW
metaData.links.id_Taxo = '44428'; % Taxonomicon
metaData.links.id_WoRMS = '126392'; % WoRMS
metaData.links.id_fishbase = 'Scomberesox-saurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberesox_saurus}}';
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
bibkey = 'AqueBrop2012'; type = 'Article'; bib = [ ... 
'author = {Antonio Ag\"{u}era and Deirdre Brophy}, ' ... 
'year = {2012}, ' ...
'title = {Growth and age of {A}tlantic saury, \emph{Scomberesox saurus saurus} ({W}albaum), in the northeastern {A}tlantic {O}cean}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {131-133}, ' ...
'pages = {60-66}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Brow1983'; type = 'Article'; bib = [ ... 
'doi = {10.2989/025776183784447430}, ' ...
'author = {C. L. Brownell}, ' ... 
'year = {1983}, ' ...
'title = {Early growth rate and feeding of a small group of laboratory-reared saury, \emph{Scomberesox saurus scombroides} ({P}isces: {S}comberesocidae)}, ' ...
'journal = {South African Journal of Marine Science}, ' ...
'volume = {1}, ' ...
'pages = {245-248}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Scomberesox-saurus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
