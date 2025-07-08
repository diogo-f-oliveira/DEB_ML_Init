function [data, auxData, metaData, txtData, weights] = mydata_Valvata_utahensis
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Valvatoida'; 
metaData.family     = 'Valvatidae';
metaData.species    = 'Valvata_utahensis'; 
metaData.species_en = 'Utah roundmouth snail'; 

metaData.ecoCode.climate = {'BSk','BWk','Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'sta@akvaplan.niva.no'}; 
metaData.date_acc  = [2021 01 24]; 

%% set data
% zero-variate data

data.am = 374; units.am = 'd';    label.am = 'life span';                bibkey.am = 'LysnKoet2006a';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.07; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';             bibkey.Lb  = 'LysnKoet2006a';
data.Lj  = 0.071; units.Lj  = 'cm';  label.Lj  = 'shell height at settlement';        bibkey.Lj  = 'LysnKoet2006a';
data.Lp  = 0.2475; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on Valvata cristata';
data.Li  = 0.487; units.Li  = 'cm';  label.Li  = 'ultimate shell height';              bibkey.Li  = 'LysnKoet2006a';

data.Wwi  = 2.97e-2; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Planorbis planorbis (including shell): 4.336e-1 * (0.45/1.1)^3';

data.Ni  = 150;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'LysnKoet2006a';   
  temp.Ni = C2K(15);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on Valvata piscinalis';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell heigth (mm)
1.355	0.171
17.253	0.227
29.633	0.251
41.127	0.284
54.878	0.308
70.360	0.303
86.783	0.307
102.056	0.308
118.731	0.320
133.567	0.327
148.181	0.336];
data.tL(:,1) = 20 + data.tL(:,1);
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LysnKoet2006';
    
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

%% Discussion
D1 = 'I invented the order-name Valvatoida myself, to comply to the makeup of the list-page';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'This snail is hermaproditic';
metaData.bibkey.F1 = 'LysnKoet2006a';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8VB7H'; % Cat of Life not present 2021/08/07
metaData.links.id_ITIS = '70360'; % ITIS
metaData.links.id_EoL = '49294908'; % Ency of Life
metaData.links.id_Wiki = 'Valvata_utahensis'; % Wikipedia
metaData.links.id_ADW = 'Valvata_utahensis'; % ADW 
metaData.links.id_Taxo = '627971'; % Taxonomicon
metaData.links.id_WoRMS = '1248571'; % WoRMS
metaData.links.id_molluscabase = '1248571'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Valvata_utahensis}}';
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
bibkey = 'LysnKoet2006'; type = 'Article'; bib = [ ... 
'author = {Steven Lysne and Peter Koetsier}, ' ... 
'year = {2006}, ' ...
'title = {GROWTH RATE AND THERMAL TOLERANCE OF TWO ENDANGERED SNAKE RIVER SNAILS}, ' ...
'journal = {Western North American Naturalist}, ' ...
'volume = {66(2)}, ' ...
'pages = {230-238}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LysnKoet2006a'; type = 'Article'; bib = [ ... 
'doi = {10.1080/02705060.2006.9664997}, ' ...
'author = {Steven Lysne and Peter Koetsier}, ' ... 
'year = {2006}, ' ...
'title = {The Life History of the {U}tah (Desert) Valvata, \emph{Valvata utahensis}, in the {S}nake {R}iver, {I}daho}, ' ...
'journal = {Journal of Freshwater Ecology}, ' ...
'volume = {21(2)}, ' ...
'pages = {285-29}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
