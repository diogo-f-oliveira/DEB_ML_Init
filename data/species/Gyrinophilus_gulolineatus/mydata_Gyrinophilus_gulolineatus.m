function [data, auxData, metaData, txtData, weights] = mydata_Gyrinophilus_gulolineatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Gyrinophilus_gulolineatus'; 
metaData.species_en = 'Berry cave salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(13); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 10];


%% set data
% zero-variate data

data.ab = 15;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(13);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'value for Plethodon cinereus';
data.am = 18.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(13);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 7;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'NiemCart2021'; 
data.Li  = 8.05;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'NiemCart2021';

data.Wwb = 1.72e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 3.2 mm of Gyrinophilus_palleucus: pi/6*0.32^3';
data.Wwi = 10.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Desmognathus quadramaculatus: (8.05/9)^3*14.6';

data.Ri  = 12/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(13);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assumed: 12 eggs per clutch, 1 clutch each yr';

% univariate data
% initial length-length after some time
LLt = [ ... % initial SVL (cm), final SVL (cm), interval (d)
    7.5  8.05 9.5*365
    4.34 5.00  33
    4.25 5.45 155];
data.LL = LLt(:,1:2); units.LL  = {'cm', 'cm'}; label.LL = {'initial SVL', 'final SVL'};  
temp.LL   = C2K(13); units.temp.LL = 'K'; label.temp.LL = 'temperature';
time.LL = LLt(:,3); units.time.LL = 'd'; label.time.LL = 'time interval';
bibkey.LL = 'NiemCart2021'; treat.LL = {0};

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 3 * weights.LL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'The Berry Cave salamander is usually a paedomorphic';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3HYSS'; % Cat of Life
metaData.links.id_ITIS = '550249'; % ITIS
metaData.links.id_EoL = '1018661'; % Ency of Life
metaData.links.id_Wiki = 'Gyrinophilus_gulolineatus'; % Wikipedia
metaData.links.id_ADW = 'Gyrinophilus_gulolineatus'; % ADW
metaData.links.id_Taxo = '142940'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Gyrinophilus+gulolineatus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gyrinophilus_gulolineatus}}';
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
bibkey = 'NiemCart2021'; type = 'Article'; bib = [ ... 
'author = {Matthew L. Niemiller and Evin T. Carter and Nicholas S. Gladstone and K. Denise Kendall Niemiller and Lindsey E. Hayter and Annette S. Engel and Brian T. Miller and Benjamin M. Fitzpatrick}, ' ... 
'year = {2021}, ' ...
'title = {Distribution, ecology, life history, and conservation status of tHE {B}erry cave salamander (\emph{Gyrinophilus gulolineatus})}, ' ...
'journal = {Herpetological Conservation and Biology}, ' ...
'volume = {16(3)}, ' ...
'pages = {686–703}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Gyrinophilus+gulolineatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

