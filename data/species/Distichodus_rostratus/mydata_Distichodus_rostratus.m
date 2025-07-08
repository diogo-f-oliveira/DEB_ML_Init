  function [data, auxData, metaData, txtData, weights] = mydata_Distichodus_rostratus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Distichodontidae';
metaData.species    = 'Distichodus_rostratus'; 
metaData.species_en = 'Grass-eater'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 08];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 08];

%% set data
% zero-variate data
data.am = 9*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(28); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30;    units.Lp = 'cm';   label.Lp = 'std length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 76;    units.Li = 'cm';   label.Li = 'ultimate std length';  bibkey.Li = 'fishbase';

data.Wwb = 8.8e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'BertKoua2008';
  comment.Wwb = 'based on egg diameter of 1.19 mm: pi/6*0.119^3';
data.Wwp = 360;  units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01288*Lp^3.01, see F1';
data.Wwi = 5.9e3;  units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01288*Li^3.01, see F1';
  
data.Ri = 7e5/365; units.Ri = '#/d'; label.Ri = 'max reprod rate'; bibkey.Ri = 'BertKoua2008';
  temp.Ri = C2K(28); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 12,004 eggs per kg: 12e4*5.9/365';
 
% univariate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
319.077	10.579
365+14.910	13.900
365+73.954	14.264
365+135.682	14.632
365+195.621	15.527
365+226.634	17.302
365+319.077	19.973
365+350.090	21.521
720+14.612	21.627
720+74.551	21.917
720+135.980	22.208];
data.tL(:,1) = data.tL(:,1) - 80; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};
temp.tL    = C2K(28);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorePalo1995';

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

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01288*(TL in cm)^3.01';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '36XM3'; % Cat of Life
metaData.links.id_ITIS = '640971'; % ITIS
metaData.links.id_EoL = '1012698'; % Ency of Life
metaData.links.id_Wiki = 'Distichodus'; % Wikipedia
metaData.links.id_ADW = 'Distichodus_rostratus'; % ADW
metaData.links.id_Taxo = '173338'; % Taxonomicon
metaData.links.id_WoRMS = '1020653'; % WoRMS
metaData.links.id_fishbase = 'Distichodus-rostratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Distichodus}}';  
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
bibkey = 'MorePalo1995'; type = 'techreport'; bib = [ ... 
'author = {Moreau, J. and M.L.D. Palomares and F.S.B. Torres and D. Pauly}, ' ... 
'year = {1995}, ' ...
'title = {Atlas d\''{e}mographique des populations de poissons d''eau douce d''{A}frique}, ' ...
'institution = {ICLARM Tech. Rep.}, ' ...
'volume = {45}, ' ...
'pages = {1-140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BertKoua2008'; type = 'Article'; bib = [ ...  
'author = {S. Bert\''{e} and E.P. Kouam\''{e}lan and N.I. Ouattara and T. Kon\''{e} and B.G. Goore and V. N''Douba and N.J. Kouassi}, ' ...
'year  = {2008}, ' ...
'title = {Cycle de reproduction et f\''{e}condit\''{e} de \emph{Distichodus rostratus} ({C}haraciformes, {D}istichodontidae) dans un bassin ouest africain (fleuve {B}andama, {C}\circ{o}te d''{I}voire)}, ' ...  
'journal = {Tropicultura}, ' ...
'volume = {26(2)}, ' ...
'pages = {104-107}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Distichodus-rostratus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

