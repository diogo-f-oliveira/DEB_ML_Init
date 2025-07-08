function [data, auxData, metaData, txtData, weights] = mydata_Coptodon_zillii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cichliformes'; 
metaData.family     = 'Cichlidae';
metaData.species    = 'Coptodon_zillii'; 
metaData.species_en = 'Redbelly tilapia'; 

metaData.ecoCode.climate = {'Am','BSk'};
metaData.ecoCode.ecozone = {'TPa','TH'};
metaData.ecoCode.habitat = {'0iFl', '0iFr'};
metaData.ecoCode.embryo  = {'Fnfm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 08 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 06];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 06];

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 35;     units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'guess';
data.Lim  = 40;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwb = 8.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter of 1.7-2.6 mm : pi/6*0.25^3';
data.Wwp = 5.35;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'fishbase','fishesoftexas'};
  comment.Wwp = 'based on 0.01622*Lp^2.98, see F1';
data.Wwim = 964;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight';      bibkey.Wwim = {'fishbase','fishesoftexas'};
  comment.Wwim = 'based on 0.01622*Lim^2.98, see F1';

data.Ri  = 6e3/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate'; bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-weight
data.tW_m = [ ... % time (d), wet weight (g)
 0	  0.001
16	  2.623
31	 20.707
45	 63.791
59	 91.875
77	136.460
92	162.042];
units.tW_m   = {'d', '9'};  label.tW_m = {'time', 'wet weight'};  
temp.tW_m    = C2K(26);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'DikeAlev2002';
comment.tW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tW_m = 5 * weights.tW_m;
weights.Ri = 5 * weights.Ri;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01622*(TL in cm)^2.98';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'Y7M9'; % Cat of Life
metaData.links.id_ITIS = '169813'; % ITIS
metaData.links.id_EoL = '52229158'; % Ency of Life
metaData.links.id_Wiki = 'Coptodon_zillii'; % Wikipedia
metaData.links.id_ADW = 'Coptodon_zillii'; % ADW
metaData.links.id_Taxo = '329494'; % Taxonomicon
metaData.links.id_WoRMS = '317356'; % WoRMS
metaData.links.id_fishbase = 'Coptodon-zillii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coptodon_zillii}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Coptodon-zillii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/tilapia zillii.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'DikeAlev2002'; type = 'Article'; bib = [ ... 
'author = {Suat Dikel and M. Vedat Alev and G\"{u}l. A. Kiri\c{s} and Metin Kumlu}, ' ... 
'year = {2002}, ' ...
'title = {Growth And Yield Of Two Tilapia Species \emph{Tilapia zillii} and \emph{Tilapia rendalli} Raised In Floating Cages In {S}eyhan {D}am {L}ake}, ' ...
'journal = {Journal of the Faculty of Agriculture}, ' ...
'volume = {17(2)}, ' ...
'pages = {93-98}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

