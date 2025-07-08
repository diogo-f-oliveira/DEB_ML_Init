function [data, auxData, metaData, txtData, weights] = mydata_Mola_mola 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Molidae';
metaData.species    = 'Mola_mola'; 
metaData.species_en = 'Ocean sunfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'biCij'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ww_t'; 'Wwi'; 'R_L'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data

data.am = 40 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'at least 20 yr; in view of high aging acceleration probably an underestimate';

data.Lb  = 0.25;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Wiki';  
data.Lp  = 155;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'estimate, derived from other species';
data.Li  = 270;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Wiki';
  comment.Li = 'mouth-to-tail; Kamogawa, Japan 1996, fact-sheet';

data.Wwb = 1.2e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'PopeHays2010';
  comment.Wwb = 'based on egg diameter of 1.3 mm: 4/3*pi*0.065^3';
data.Ww454 = 3.99e5; units.Ww454 = 'g'; label.Ww454 = 'wet weight at 454 d'; bibkey.Ww454 = 'Wiki';
  temp.Ww454 = C2K(25); units.temp.Ww454 = 'K'; label.temp.Ww454 = 'temperature'; 
  comment.Ww454 = 'starting from 26 kg at t = 0';
data.Wwi = 2.3e6;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fact_sheet';
  comment.Wwi = 'Kamogawa, Japan 1996';

data.R137  = 3e10/365; units.R137  = '#/d'; label.R137  = 'reprod rate at length 137 cm'; bibkey.R137  = 'Schm1921';   
  temp.R137 = C2K(25); units.temp.R137 = 'K'; label.temp.R137 = 'temperature';
 
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Wiki: Monterey Bay Aquarium increased in weight from 26 to 399 kg and reached a height of nearly 1.8 m in 454 days (PopeHays2010)';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = ['TLt = 318.4 (1-exp (-0.149 (t-0.031))) TLt: total length (cm) at age t(days); ' ...
    'GI = (GW/TL^3) * 10000; ' ...
    'BW = 3.00 * 10-5 * TL^3.11 (R2=0.959, captive) or BW = 7.64 * 10-5 * TL2.90 (R2=0.987, wild) for TL < 200 cm; ' ...
    'BW increases steeper with TL for TL > 200 cm (probaly due to reprod); ' ...
    'spawning late August to late September, multiople spawners; ' ...
    'females are bigger than males.'];
metaData.bibkey.F1 = 'Naka2008'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43V8G'; % Cat of Life
metaData.links.id_ITIS = '173414'; % ITIS
metaData.links.id_EoL = '46570742'; % Ency of Life
metaData.links.id_Wiki = 'Mola_mola'; % Wikipedia
metaData.links.id_ADW = 'Mola_mola'; % ADW
metaData.links.id_Taxo = '47097'; % Taxonomicon
metaData.links.id_WoRMS = '127405'; % WoRMS
metaData.links.id_fishbase = 'Mola-mola'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mola_mola}}';
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
bibkey = 'Naka2008'; type = 'phdthesis'; bib = [ ... 
'author = {Nakatsubo, T.}, ' ... 
'year = {2008}, ' ...
'title = {A study on the reproductive biology of ocean sunfish \emph{Mola mola}}, ' ...
'school = {Dissertation, International Marine Biological Institute, Kamagora Sea World, Japan}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Schm1921'; type = 'Article'; bib = [ ... 
'author = {Schmidt, J.}, ' ... 
'year = {1921}, ' ...
'title = {New studies of sun-fishes made during the "Dana" Expedition}, ' ...
'journal = {Nature}, ' ...
'volume = {107}, ' ...
'pages = {76-79}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PopeHays2010'; type = 'Article'; bib = [ ... 
'author = {Pope, E. C. and Hays, G. C. and Thys, T. M. and Doyle, T. K. and Sims, D. W. and Queiroz, N. and Hobson, V. J. and Kubicek, L. and Houghton, J. D. R.}, ' ... 
'year = {2010}, ' ...
'title = {The biology and ecology of the ocean sunfish \emph{Mola mola}: a review of current knowledge and future research perspectives}, ' ...
'journal = {Rev Fish Biol Fisheries}, ' ...
'doi = {10.1007/s11160-009-9155-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fact_sheet'; type = 'Misc'; bib = ...
'howpublished = {\url{http://scubali.com/news/mola-mola-fact-sheet.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.us/PopDyn/KeyfactsSummary_2v2.php?ID=1732&GenusName=Mola&SpeciesName=mola&vStockCode=1928&fc=450}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

