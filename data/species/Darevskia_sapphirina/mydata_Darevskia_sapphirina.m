function [data, auxData, metaData, txtData, weights] = mydata_Darevskia_sapphirina
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Darevskia_sapphirina'; 
metaData.species_en = 'Van lizard'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd', '0iTs', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apo'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 06];

%% set data
% zero-variate data

data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty';  bibkey.ap = 'ArakPetr2013';
  temp.ap = C2K(20); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 6*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'ArakPetr2013';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 2.13;  units.Lb  = 'cm'; label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'guess'; 
  comment.Lb = 'based on Darevskia_derjugini 2.25*5.9/6.23';
data.Li  = 5.9;  units.Li  = 'cm'; label.Li  = 'ultimate SVL for females'; bibkey.Li  = 'ArakPetr2013';  

data.Wwb = 0.17;  units.Wwb = 'g';  label.Wwb = 'ultimate wet '; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Darevskia_derjugini: 0.26*4.34/6.6';
data.Wwi = 4.35;  units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'EoL';

data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '8 eggs per clutch, 1 cluth per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm)
3	4.864
4	5.462
5	5.785
6	5.947];
data.tL(:,1) = (data.tL(:,1)+0.5) * 365; % convert yr to d
units.tL = {'d','cm'};  label.tL = {'time since birth','SVL'};  
temp.tL  = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ArakPetr2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 2 * weights.Lb;
weights.Li = 2 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'This species is parthenogenetic';
metaData.bibkey.F1 = 'ArakPetr2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3462C'; % Cat of Life
metaData.links.id_ITIS = '1155285'; % ITIS
metaData.links.id_EoL = '792809'; % Ency of Life
metaData.links.id_Wiki = 'Darevskia_sapphirina'; % Wikipedia
metaData.links.id_ADW = 'Darevskia_sapphirina'; % ADW
metaData.links.id_Taxo = '642538'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Darevskia&species=sapphirina'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Darevskia_sapphirina}}';
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
bibkey = 'ArakPetr2013'; type = 'Article'; bib = [ ... 
'doi = {10.1163/15707563-bja10025}, ' ...
'author = {Marine Arakelyan and Ruzanna Petrosyanand \c{C}etin Ilgaz and Yusuf Kumluta\c{s} and Salih Hakan Durmu\c{s} and Yahya Tayhan and Felix Danielyan}, ' ... 
'year = {2013}, ' ...
'title = {A skeletochronological study of parthenogenetic lizards of genus \emph{Darevskia} from {T}urkey}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {8(2)}, ' ...
'pages = {99-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/792809}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
