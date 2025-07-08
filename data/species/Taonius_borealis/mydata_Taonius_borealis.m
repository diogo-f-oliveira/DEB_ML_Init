function [data, auxData, metaData, txtData, weights] = mydata_Taonius_borealis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Oegopsida'; 
metaData.family     = 'Cranchiidae';
metaData.species    = 'Taonius_borealis'; 
metaData.species_en = 'Glass squid'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPN'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 03 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 17]; 

%% set data
% zero-variate data

data.am = 3*365;   units.am = 'd';    label.am = 'life span for female';      bibkey.am = 'guess';   
  temp.am = C2K(7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.5;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';       bibkey.Lb  = 'Arkh1996';
data.Lp  = 100;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';       bibkey.Lp  = 'guess';
data.Li  = 215;  units.Li  = 'cm'; label.Li  = 'mantle length at death for female'; bibkey.Li  = 'Nesi82';
  comment.Li = '200-225 cm';

data.Wwi  = 1e5;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';       bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on size-corrected value for Loligo_forbesii: 8300*(215/93.7)^3';
  
data.GSI  = 0.15; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'guess';   
  temp.GSI = C2K(7);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
277.312	39.456
278.594	37.755
285.557	31.406
295.016	40.136];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(7);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Arkh1996';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death, not by ageing';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '54R8Z'; % Cat of Life
metaData.links.id_ITIS = '556321'; % ITIS
metaData.links.id_EoL = '491439'; % Ency of Life
metaData.links.id_Wiki = 'Taonius_borealis'; % Wikipedia
metaData.links.id_ADW = 'Belonella_borealis'; % ADW
metaData.links.id_Taxo = '3984712'; % Taxonomicon
metaData.links.id_WoRMS = '410406'; % WoRMS
metaData.links.id_molluscabase = '410406'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Taonius_borealis}}';
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
bibkey = 'Arkh1996'; type = 'article'; bib = [ ... 
'author = {Alexander Arkhipkin}, ' ... 
'year = {1996}, ' ...
'title = {Statolith microstructure and age of early life stages of planktonic squids \emph{Galiteuthis phyllura} and \emph{Belonella borealis} ({O}egopsida, {C}ranchiidae) from the northern {N}orth {P}acific}, ' ...
'journal = {Journal of Plankton Research}, ' ...
'volume = {18(l)}, ' ...
'pages = {123-132}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Nesi82'; type = 'Book'; bib = [ ...  
'author = {Nesis, K. N.}, ' ...
'year = {1982}, ' ...
'title  = {Cephalopods of the world}, ' ...
'publisher = {T.F.H. Publications}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'address = {Neptune City, NY}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Taonius-borealis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

