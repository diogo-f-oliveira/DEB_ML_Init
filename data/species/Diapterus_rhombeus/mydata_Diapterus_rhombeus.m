function [data, auxData, metaData, txtData, weights] = mydata_Diapterus_rhombeus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gerreiformes'; 
metaData.family     = 'Gerreidae';
metaData.species    = 'Diapterus_rhombeus'; 
metaData.species_en = 'Caitipa mojarra'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2025 02 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 02 14];

%% set data
% zero-variate data

data.am = 8.5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(26.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temps are guessed; am of 10 yr is oldest year class in tL data';
  
data.Lp  = 13;  units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 18;  units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'Aust1971';
  comment.Li = 'fishbase gives 42.3 cm, but that seems unlikely given Wwi; Aust1971 gives 17.5 cm';

data.Wwb = 3.9e-5; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Aust1971';
  comment.Wwb = 'based guessed egg diameter of 0.42 mm: pi/6*0.042^3'; 
data.Wwp = 28.5; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01202*Lp^3.03, see F1';
data.Wwi = 76.45; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01202*Li^3.03, see F1; max. published weight: 76.30 g';

data.Ri  = 2.6e5/365; units.Ri  = '#/d';label.Ri  = 'max reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(26.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Gerres oyena: 367200*(18/20.1)^3';
  
% uni-variate data
% time-length
data.tL = [  ... % time since birth (d), standard length (cm)
91.193	2.951
127.070	3.809
154.262	5.141
154.285	5.521
155.211	4.824
172.683	5.554
172.708	5.965
209.602	7.615
211.498	6.950
213.339	5.366
228.043	8.345
231.897	8.028
260.030	8.917
263.793	7.111
263.826	7.649
301.588	7.651
301.694	9.394
327.777	8.413
328.872	10.504
365.656	10.348
399.570	10.761
400.555	11.047
427.713	11.808
428.667	11.587
429.603	11.048
431.536	10.985
455.838	12.570
491.610	11.685
519.785	13.271
526.540	12.891
577.965	14.668
581.775	13.622];
data.tL(:,1) = data.tL(:,1)+0; % set origin at birth
data.tL(:,2) = data.tL(:,2)/ 0.83; % convert SL to TL
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(26.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Aust1971';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'weight-length relationship: W in g = 0.01202*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '35DFM'; % Cat of Life
metaData.links.id_ITIS = '169027'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Diapterus'; % Wikipedia
metaData.links.id_ADW = 'Diapterus_rhombeus'; % ADW
metaData.links.id_Taxo = '173116'; % Taxonomicon
metaData.links.id_WoRMS = '276415'; % WoRMS
metaData.links.id_fishbase = 'Diapterus-rhombeuss'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diapterus}}';
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
bibkey = 'Aust1971'; type = 'article'; bib = [ ... 
'author = {Austin, H.M}, ' ... 
'year = {1971}, ' ...
'title = {Some aspects of the biology of the rhomboid mojarra \emph{Diapterus rhombeus} in {P}uerto {R}ico}, ' ...
'journal = {Bull. Mar. Sci.}, ' ...
'volume = {21(4)}, ' ...
'pages = {886-903}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Diapterus-peruvianus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

