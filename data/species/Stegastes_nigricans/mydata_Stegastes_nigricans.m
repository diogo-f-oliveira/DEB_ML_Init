function [data, auxData, metaData, txtData, weights] = mydata_Stegastes_nigricans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Stegastes_nigricans'; 
metaData.species_en = 'Dusky farmerfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.4); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 06];

%% set data
% zero-variate data

data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.4);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 9*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 5.2e-4;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3'; 
data.Wwp = 3.1;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.02399*Lp^3.02, see F1';
data.Wwi = 69.4;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02399*Li^3.02, see F1';

data.Ri  = 200; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(28.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Chromis chromis';
  
% uni-variate data
% time-length
data.tL = [ ... % time (d), standard length (cm)
164.764	1.670
195.624	3.774
227.345	4.457
257.063	5.522
287.992	6.150
319.690	7.325
365+74.256	10.342
365+134.894	12.253
365+165.437	12.662
365+196.407	12.415
365+226.556	12.768
365+258.282	13.342
730+104.985	15.235];
data.tL(:,1) = data.tL(:,1) - 100; % set origin at birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(28.4);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'AriaGalz1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02399*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZNNG'; % Cat of Life
metaData.links.id_ITIS = '615111'; % ITIS
metaData.links.id_EoL = '46572320'; % Ency of Life
metaData.links.id_Wiki = 'Stegastes_nigricans'; % Wikipedia
metaData.links.id_ADW = 'Stegastes_nigricans'; % ADW
metaData.links.id_Taxo = '188081'; % Taxonomicon
metaData.links.id_WoRMS = '218849'; % WoRMS
metaData.links.id_fishbase = 'Stegastes-nigricans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Stegastes_nigricans}}';
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
bibkey = 'AriaGalz1993'; type = 'Article'; bib = [ ... 
'howpublished = {\url{http://hdl.handle.net/20.500.12348/2925}}, ' ...
'author = {J. E. Arias-Gonz\''{a}lez and R. Galzin and F. Torres}, ' ... 
'year = {1993}, ' ...
'title = {Growth and mortality of \emph{Ctenochaetus striatus}, \emph{Stegastes nigricans} and \emph{Sargocentron microstoma} in {T}iahura {R}eef, {M}oorea {I}sland, {F}rench {P}olynesia}, ' ...
'journal = {NAGA, the ICLARM Quarterly}, ' ...
'volume = {16(4)}, ' ...
'pages = {32-35}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Stegastes-nigricans.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
