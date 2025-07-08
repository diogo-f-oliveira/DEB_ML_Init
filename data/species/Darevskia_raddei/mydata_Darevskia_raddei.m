function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_raddei
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_raddei'; 
metaData.species_en = 'Armenian lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 06];

%% set data
% zero-variate data

data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'ArakDanie2000';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'ArakDanie2000';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 5.2;  units.Li  = 'cm'; label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'ReptileDB';  

data.Wwb = 0.26;  units.Wwb = 'g';  label.Wwb = 'ultimate wet '; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Darevskia_derjugini';
data.Wwi = 10.89;  units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 eggs per clutch, 1 cluth per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), femur bone layer (mum)
1	6.395
2	13.372
3	16.279
4	17.442
5	18.314
6	18.895];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
data.tL(:,2) = data.tL(:,2)*5.2/19; % convert femuer bone layer (mum) to SVL (cm) using Li
units.tL = {'d','cm'};  label.tL = {'time since birth','SVL'};  
temp.tL  = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArakDanie2000';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'A time-offset was required to match early growth with later growth';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Lacerta raddei (and Lacerta nairensis) has been implicated as maternal parents of the parthenogenetic L. rostombekovi and L. unisexualis, respectively';
metaData.bibkey.F1 = 'ReptileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '34636'; % Cat of Life
metaData.links.id_ITIS = '1155338'; % ITIS
metaData.links.id_EoL = '792852'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_raddei'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_raddei'; % ADW
metaData.links.id_Taxo = '642535'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=raddei'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_raddei}}';
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
bibkey = 'ArakDanie2000'; type = 'Article'; bib = [ ... 
'author = {Arakelyan, M. and Danielyan, F.}, ' ... 
'year = {2000}, ' ...
'title = {Age and growth of some parthenogenetic and bisexual species of rock lizards (\emph{Lacerta}), from {A}rmenia}, ' ...
'journal = {Zool. J.}, ' ...
'volume = {79}, ' ...
'pages = {585-590}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/792852}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ReptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Darevskia&species=raddei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
