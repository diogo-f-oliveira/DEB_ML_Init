function [data, auxData, metaData, txtData, weights] = mydata_Amphioctopus_burryi

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Amphioctopus_burryi'; 
metaData.species_en = 'Brown-striped octopus'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMb'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(23.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 04 14];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 04 14]; 

%% set data
% zero-variate data

data.ab = 26;   units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'ForsHanl1985';   
  temp.ab = C2K(23.5); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 305;   units.am = 'd';    label.am = 'life span for female';        bibkey.am = 'ForsHanl1985';   
  temp.am = C2K(23.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.15;  units.Lb  = 'cm'; label.Lb  = 'mantle length at birth';     bibkey.Lb  = 'ForsHanl1985';
data.Lp  = 4;  units.Lp  = 'cm'; label.Lp  = 'mantle length at puberty';     bibkey.Lp  = 'ForsHanl1985';
data.Li  = 6.6;  units.Li  = 'cm'; label.Li  = 'mantle length at death';     bibkey.Li  = 'sealifebase';
data.Lim  = 7.5;  units.Lim  = 'cm'; label.Lim  = 'mantle length at death for males';     bibkey.Lim  = 'sealifebase';

data.Wwi  = 80.1;  units.Wwi  = 'g'; label.Wwi  = 'wet weight at death';     bibkey.Wwi  = 'ForsHanl1985';
  comment.Wwi = 'based on (L_i/L_im)3*Wwim';
data.Wwim  = 117.6;  units.Wwim  = 'g'; label.Wwim  = 'wet weight at death';     bibkey.Wwim  = 'ForsHanl1985';

data.Ni  = 250; units.Ni  = '#';  label.Ni  = 'fecundity';    bibkey.Ni  = 'ForsHanl1985';   
  temp.Ni = C2K(23.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), mantle length (cm)
 0      0.15   
71.018	4.047
79.532	4.746
86.253	5.298
93.646	5.802
100.815	6.527];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'mantle length'};  
temp.tL    = C2K(23.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ForsHanl1985';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'End of acceleration is assumed to coincide with puberty';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'Programmed death';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Plantonic stage lasts 4-6 weeks';
metaData.bibkey.F2 = 'ForsHanl1985'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'D45Z'; % Cat of Life
metaData.links.id_ITIS = '82615'; % ITIS
metaData.links.id_EoL = '492286'; % Ency of Life
metaData.links.id_Wiki = 'Amphioctopus'; % Wikipedia
metaData.links.id_ADW = 'Octopus_burryi'; % ADW
metaData.links.id_Taxo = '3940548'; % Taxonomicon
metaData.links.id_WoRMS = '420653'; % WoRMS
metaData.links.id_molluscabase = '420653'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Amphioctopus}}';
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
bibkey = 'ForsHanl1985'; type = 'article'; bib = [ ... 
'author = {John Forsythe and Roger Hanlon}, ' ... 
'year = {1985}, ' ...
'title = {ASPECTS OF EGG DEVELOPMENT, POST-HATCHING BEHAVIOR, GROWTH AND REPRODUCTIVE BIOLOGY OF \emph{Octopus burryi} {V}OSS, 1950 ({M}OLLUSCA: {C}EPHALOPODA)}, ' ...
'journal = {Vie et Milieu/ Life \& Environment, Observatoire Oc\''{e}anologique - Laboratoire Arago}, ' ...
'note = {hal-03022234}, ' ...
'volume = {18}, ' ...
'pages = {273-282}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Amphioctopus-burryi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

