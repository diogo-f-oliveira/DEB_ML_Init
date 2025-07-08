function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_whitei

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_whitei'; 
metaData.species_en = 'White''s seahorse'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Carlos MGL Teixeira'};    
metaData.date_subm = [2010 09 28];              
metaData.email    = {'carlos.teixeira@tecnico.ulisboa.pt'};            
metaData.address  = {'IST, Lisbon University'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 10 16];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 01 02]; 

%% set data
% zero-variate data

data.ab = 23;      units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'Pita2007';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab  = 'obtained from average incubation time';
data.ap = 182.5;     units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'Pita2007';
  temp.ap = C2K(20);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 1715.5;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AnAge';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'observed longevity in captive specimens of Hippocampus erectus (Lined Seahorse)';

data.Lb  = 3.827;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'WongBenz2003';  
data.Li  = 11;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'WongBenz2003';

data.Wwb = 0.04893544; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'VincGile2003';
data.Wwi = 6.5;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'WongBenz2003';
  comment.Wwi = 'average observed adult weight';

data.Ri  = 0.8219;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'VincGile2003';   
  temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'brood average mass';
 
% uni-variate data
% t-L data
data.tL = [ ...
 0.98823529 3.82695450;
23.01176471	4.29519554;
38.02352941	4.66164505;
50.96470588	4.90594473;
64.98823529	5.29071671;
78.96470588	5.55333886;
93.03529412	5.86482095;
107.05882353 6.10912062;];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WongBenz2003';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Optimal temperature for reproduction is 20 C';
metaData.bibkey.F1 = 'WongBenz2003'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3LZPW'; % Cat of Life
metaData.links.id_ITIS = '644920'; % ITIS
metaData.links.id_EoL = '46567776'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_whitei'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_whitei'; % ADW
metaData.links.id_Taxo = '176713'; % Taxonomicon
metaData.links.id_WoRMS = '212235'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus-whitei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_whitei}}';
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
bibkey = 'HiloDelo2003'; type = 'Article'; bib = [ ... 
'author = {Hilomen-Garcia, G. V. and Delos Reyes, R. and Garcia, C. M. H.}, ' ... 
'year = {2003}, ' ...
'title = {Tolerance of seahorse \emph{Hippocampus kuda} ({B}leeker) juveniles to various salinities}, ' ...
'journal = {Journal of Applied Icthyology}, ' ...
'volume = {19}, ' ...
'pages = {94--98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Pita2007'; type = 'Book'; bib = [ ... 
'author = {Pitargue, C. K.}, ' ... 
'year = {2007}, ' ...
'title = {Husbandry Manual For White''s Seahorse}, ' ...
'publisher = {Western Sydney Institute of TAFE, Richmond, Australia}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VincGile2003'; type = 'Article'; bib = [ ... 
'author = {Vincent, A. C. J. and Giles, B. G.}, ' ... 
'year = {2003}, ' ...
'title = {Correlates of reproductive success in a wild population of \emph{Hippocampus whitei}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {63}, ' ...
'pages = {344--355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WongBenz2003'; type = 'Article'; bib = [ ... 
'author = {Wong, J. M. and Benzie, J. A. H.}, ' ... 
'year = {2003}, ' ...
'title = {The effects of temperature, {A}rtemia enrichment, stocking density and light on the growth of juvenile seahorses, \emph{Hippocampus whitei} ({B}leeker, 1855), from {A}ustralia}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {228}, ' ...
'pages = {107--121}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hippocampus_whitei}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
