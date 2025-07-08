function [data, auxData, metaData, txtData, weights] = mydata_Cyrtopodion_scabrum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Gekkonidae';
metaData.species    = 'Cyrtopodion_scabrum'; 
metaData.species_en = 'Rough-tailed gecko'; 

metaData.ecoCode.climate = {'BWh', 'BSh', 'Dsa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 02];

%% set data
% zero-variate data

data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Heteronotia_binoei';

data.Lb  = 1.95;  units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'Ibra2013';  
data.Lp  = 3.4;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Ibra2013';  
data.Li  = 5.2;   units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'Ibra2013';  

data.Wwi = 3.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Heteronotia_binoei: (5.2/5)^3*3.1';

data.Ri  = 1.2/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'Ibra2013';   
  temp.Ri = C2K(28);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1, sometimes 2, eggs per clutch, 1 clutch each 1  yr';

% univariate data
% time -  length data
data.LdL = [ ... % SVL (cm), percent growth in 6 months
2.9	24.288
3.4	11.479
3.5	12.033
3.9	2.717
4.3	5.490
4.8	4.436];
data.LdL(:,2) = data.LdL(:,2)/ 6/ 30.5/ 100 .* data.LdL(:,2); % convert percent growth in 7 months to cm/d
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(28);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Ibra2013';
comment.LdL = 'growth from Oct to April, most growth in spring hardly in winter';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;

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
F1 = 'Displays communal nesting; no sexual dimorphy';
metaData.bibkey.F1 = 'Ibra2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '33ND8'; % Cat of Life
metaData.links.id_ITIS = '208988'; % ITIS
metaData.links.id_EoL = '795121'; % Ency of Life
metaData.links.id_Wiki = 'Cyrtopodion_scabrum'; % Wikipedia
metaData.links.id_ADW = 'Cyrtopodion_scabrum'; % ADW
metaData.links.id_Taxo = '344782'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Cyrtopodion&species=scabrum'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cyrtopodion_scabrum}}';
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
bibkey = 'Ibra2013'; type = 'Article'; bib = [ ... 
'author = {Adel A. Ibrahim}, ' ... 
'year = {2013}, ' ...
'title = {Ecology of the Rough-tailed Gecko, \emph{Cyrtopodion scabrum} ({S}quamata: {G}ekkonidae) in the {S}uez {C}anal Zone, {E}gypt}, ' ...
'pages = {148-155}, ' ...
'volume = {47(1)}, ' ...
'journal = {Journal of Herpetology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
