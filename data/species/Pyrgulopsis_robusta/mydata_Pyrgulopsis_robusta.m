function [data, auxData, metaData, txtData, weights] = mydata_Pyrgulopsis_robusta
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Littorinimorpha'; 
metaData.family     = 'Hydrobiidae';
metaData.species    = 'Pyrgulopsis_robusta'; 
metaData.species_en = 'Jackson lake springsnail'; 

metaData.ecoCode.climate = {'BSk','BWk','Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr', '0iFl'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biHa'};
metaData.ecoCode.gender  = {'H'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 24];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'sta@akvaplan.niva.no'}; 
metaData.date_acc  = [2021 01 24]; 

%% set data
% zero-variate data

data.am = 382; units.am = 'd';    label.am = 'life span';                bibkey.am = 'fs';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.1; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';             bibkey.Lb  = 'fs';
data.Lj  = 0.11; units.Lj  = 'cm';  label.Lj  = 'shell height at settlement';        bibkey.Lj  = 'fs';
data.Lp  = 0.4; units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'guess';
data.Li  = 0.750; units.Li  = 'cm';  label.Li  = 'ultimate shell height';              bibkey.Li  = 'fs';

data.Wwi  = 0.137; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = 'guess';
 comment.Wwi = 'based on size-corrected value for Planorbis planorbis (including shell): 4.336e-1 * (0.75/1.1)^3';

data.Ni  = 150;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'guess';   
  temp.Ni = C2K(15);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'based on Valvata piscinalis';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), shell heigth (mm)
0.777	1.866
8.706	2.402
20.873	2.739
35.718	3.116
50.831	3.000
66.902	3.266
83.244	3.057
99.133	3.295];
data.tL(:,1) = 15 + data.tL(:,1);
data.tL(:,2) = data.tL(:,2)/ 10; % convert mm to cm
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

%% Links
metaData.links.id_CoL = '7SYX3'; % Cat of Life
metaData.links.id_ITIS = '568232'; % ITIS
metaData.links.id_EoL = '498215'; % Ency of Life
metaData.links.id_Wiki = 'Pyrgulopsis_robusta'; % Wikipedia
metaData.links.id_ADW = 'Pyrgulopsis_robusta'; % ADW
metaData.links.id_Taxo = '557352'; % Taxonomicon
metaData.links.id_WoRMS = '1349196'; % WoRMS
metaData.links.id_molluscabase = '1349196'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pyrgulopsis_robusta}}';
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
bibkey = 'fs'; type = 'Misc'; bib = [ ...
'howpublished = {\url{https:\\www.fs.fed.us}}, ' ...
'note = {factsheet for Pygulopsis robusta}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

