function [data, auxData, metaData, txtData, weights] = mydata_Sepia_officinalis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Sepiida'; 
metaData.family     = 'Sepiidae';
metaData.species    = 'Sepia_officinalis'; 
metaData.species_en = 'Common cuttlefish'; 
metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MANE', 'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};
metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ni'; 'GSI'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2009 03 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2013 05 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2016 01 04];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 10]; 


%% set data
% zero-variate data

data.ab = 24;   units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'ForsDeRu1994';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Temps are guessed';
data.tp = 410;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'ForsDeRu1994';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 550;  units.am = 'd';    label.am = 'life span';                   bibkey.am = 'ForsDeRu1994';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.7; units.Lb  = 'cm';  label.Lb  = 'mantle length at birth';     bibkey.Lb  = 'ForsDeRu1994';
data.Lp  = 9;   units.Lp  = 'cm';  label.Lp  = 'mantle length at puberty';   bibkey.Lp  = 'ForsDeRu1994';
data.Li = 24.1; units.Li  = 'cm';  label.Li  = 'mantle length at death of female';     bibkey.Li  = 'ForsDeRu1994';
data.Li_m = 21.3; units.Li_m  = 'cm';  label.Li_m  = 'mantle length at death of male'; bibkey.Li_m  = 'ForsDeRu1994';

data.Wwb = 0.15;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'ForsDeRu1994';
data.Wwi = 2800;  units.Wwi = 'g';  label.Wwi = 'wet weight at death';       bibkey.Wwi = 'ForsDeRu1994';

data.Ni  = 6000;  units.Ni  = '#'; label.Ni  = 'cum reprod at death';        bibkey.Ni  = 'OnsoSalm2005';   
  temp.Ni = C2K(18);  units.temp.Ni = 'K';   label.temp.Ni = 'temperature';
  comment.Ni = 'potential reprod 3700-8000 eggs';

data.GSI  = 0.13;  units.GSI  = '-'; label.GSI  = 'gonado somatic index';    bibkey.GSI  = 'OnsoSalm2005';   
  temp.GSI = C2K(15);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = '0.127 in June, 0.098 in March in females';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 0;
weights.Wwb = 5 * weights.Wwb;
weights.Wwi = 5 * weights.Wwi;
weights.am = 5 * weights.am;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Notice that L_b^3/Ww_b = 2.3 and L_m^3/Ww_i = 4.9';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'Death is programmed, not by ageing; reprod once just before death';
metaData.bibkey.F1 = 'seafish'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6YGHL'; % Cat of Life
metaData.links.id_ITIS = '82363'; % ITIS
metaData.links.id_EoL = '448836'; % Ency of Life
metaData.links.id_Wiki = 'Sepia_officinalis'; % Wikipedia
metaData.links.id_ADW = 'Sepia_officinalis'; % ADW
metaData.links.id_Taxo = '169813'; % Taxonomicon
metaData.links.id_WoRMS = '141444'; % WoRMS
metaData.links.id_molluscabase = '141444'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sepia_officinalis}}';
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
bibkey = 'OnsoSalm2005'; type = 'Article'; bib = [ ... 
'author = {Onsoy, B. and Salman, A.}, ' ... 
'year = {2005}, ' ...
'title = {Reproductive Biology of the Common Cuttlefish \emph{Sepia officinalis} {L}. ({S}epiida: {C}ephalopoda) in the {A}egean {S}ea}, ' ...
'journal = {Turk J Vet Anim Sci}, ' ...
'volume = {29}, ' ...
'pages = {613--619}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ForsDeRu1994'; type = 'Article'; bib = [ ... 
'author = {Forsythe, J. W. and DeRusha, R. H. and Hanlon, R. T.}, ' ... 
'year = {1994}, ' ...
'title = {Growth, reproduction and life span of \emph{Sepia officinalis} ({C}ephalopoda: {M}ollusca) cultured through seven consecutive generations}, ' ...
'journal = {J. Zool. Lond.}, ' ...
'volume = {233}, ' ...
'number = {2}, '...
'pages = {175--192}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'seafish'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.seafish.org/media/publications/sr467.pdf}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
