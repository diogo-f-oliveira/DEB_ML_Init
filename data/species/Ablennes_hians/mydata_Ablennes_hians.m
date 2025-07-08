function [data, auxData, metaData, txtData, weights] = mydata_Ablennes_hians
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Beloniformes'; 
metaData.family     = 'Belonidae';
metaData.species    = 'Ablennes_hians'; 
metaData.species_en = 'Flat needlefish'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'biMcp'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.9); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 05 13];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 13];

%% set data
% zero-variate data

data.ab = 4;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27.9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 47.4; units.Lp  = 'cm'; label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on Belone belone: 31.5*140/93';
data.Li  = 140;     units.Li  = 'cm'; label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 144;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00085*Lp^3.12, see F1';
data.Wwi = 4.2e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00085*Li^3.12, see F1';
 
data.Ri = 3.2e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate'; bibkey.Ri = 'guess';
  temp.Ri = C2K(27.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Belone belone: (140/75)^3*5000';

% uni-variate data
% time-length
data.tL = [ ... % time since hatch (d), total length (cm)
247.484	45.555
282.890	47.231
306.738	50.249
349.450	54.009
371.000	57.408
406.553	60.225
435.141	63.618
456.667	66.827
492.172	69.264
522.984	71.705
553.748	73.766
584.560	76.207
612.954	78.080
643.669	79.761
674.530	82.582
698.207	84.270
738.257	85.562
766.772	88.385
795.044	89.309
813.666	88.152
828.227	91.938
841.767	87.745
868.277	93.230
889.900	97.200
924.943	96.027
960.277	97.134
1017.015	100.501
1052.471	102.557];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KasiHams1996';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL_m'};
% subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00085*(TL in cm)^3.12';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '8L46'; % Cat of Life
metaData.links.id_ITIS = '165548'; % ITIS
metaData.links.id_EoL = '46566895'; % Ency of Life
metaData.links.id_Wiki = 'Ablennes_hians'; % Wikipedia
metaData.links.id_ADW = 'Ablennes_hians'; % ADW
metaData.links.id_Taxo = '159784'; % Taxonomicon
metaData.links.id_WoRMS = '159246'; % WoRMS
metaData.links.id_fishbase = 'Ablennes-hians'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ablennes_hians}}';
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
bibkey = 'KasiHams1996'; type = 'Article'; bib = [ ... 
'author = {H. Mohamad Kasim and K. M. S. Ameer Hamsa and T. S. Balasubramanian and S. Rajapackiam}, ' ... 
'year = {1996}, ' ...
'title = {Fishery of full beaks and half beaks with specis reference on the growth, mortality and stock assessment of \emph{Ablennes hians} ({V}alenciennes) along the {T}uticorin coast, {G}ulf of {M}annar}, ' ...
'journal = {Indian J. Fish.}, ' ...
'volume = {43}, ' ...
'pages = {51-59}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Ablennes-hians.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
