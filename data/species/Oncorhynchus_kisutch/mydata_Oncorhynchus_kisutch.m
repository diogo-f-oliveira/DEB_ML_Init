function [data, auxData, metaData, txtData, weights] = mydata_Oncorhynchus_kisutch

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Oncorhynchus_kisutch'; 
metaData.species_en = 'Coho salmon'; 

metaData.ecoCode.climate = {'MC','BSk','BWk'};
metaData.ecoCode.ecozone = {'MPN','TH'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'bjCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(5); 
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 07 16];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 16]; 


%% set data
% zero-variate data
  
  data.ab = 145.5;    units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'BretShel1975';  
    temp.ab = C2K(4.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  data.tp = 3*365;    units.tp = 'd';    label.tp = 'time since birth at puberty';    bibkey.tp = 'fishbase';           
    temp.tp = C2K(5);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  data.am = 5*365;    units.am = 'd';    label.am = 'life span';    bibkey.am = 'fishbase';           
    temp.am = C2K(5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
 
  data.Lp  = 77;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase';
    comment.Lp = 'based on same relative length, compared to O. nerka: 108*60/84';
  data.Li  = 108;  units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';
    comment.Li = 'Wiki gives 55 cm';
  
  data.Wwb = 0.3137;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';  bibkey.Wwb = 'BretShel1975';  
  data.Wwp = 10.8e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'fishbase';
    comment.Wwp = 'based on Wwi*(Lp/Li)^3';
  data.Wwi = 15.2e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';

  data.NR  = 6906;   units.NR  = '#';   label.NR  = 'eggs at the end of life';bibkey.NR  = 'fishbase';   
    temp.NR = C2K(5); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% Uni-variated data
% time-length
data.tL = [ % ... % time (d), total length (cm)
3.690	3.072
50.841	5.181
67.031	5.736
136.593	5.129
145.321	5.399
371.937	6.309
410.621	7.421
498.613	8.152
508.745	8.024
716.721	8.179
739.271	8.579
740.276	9.290];
data.tL(:,1) = data.tL(:,1)+100;
units.tL   = {'d', 'cm'};  label.tL = {'time','total length'};  
temp.tL    = C2K(5);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Raym1986';

%% set weights for all real data
weights = setweights(data, []);
weights.tp = 3 * weights.tp;
weights.Wwp = 3 * weights.Wwp;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 8 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females (deviating morphology develops during migration upstream river)';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.00871*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'dies soon after spawning';
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'land-locked populations are knoen as kokanee';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = '49JF8'; % Cat of Life
metaData.links.id_ITIS = '161977'; % ITIS
metaData.links.id_EoL = '46563137'; % Ency of Life
metaData.links.id_Wiki = 'Oncorhynchus_kisutch'; % Wikipedia
metaData.links.id_ADW = 'Oncorhynchus_kisutch'; % ADW
metaData.links.id_Taxo = '42806'; % Taxonomicon
metaData.links.id_WoRMS = '127184'; % WoRMS
metaData.links.id_fishbase = 'Oncorhynchus-kisutch'; % fishbase


%% References%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Oncorhynchus_kisutch}}';
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
bibkey = 'Raym1986'; type = 'techreport'; bib = [ ... 
'author = {J. A. Raymond}, ' ... 
'year = {1986}, ' ...
'title = {Growth of wild and hatchery juvenile coho salmon in an interior {A}laska stream}, ' ...
'institution = {Alaska Dept of Fish and Game}, ' ...
'series = {FRED Reports}, ' ...
'volume = {60}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BretShel1975'; type = 'Article'; bib = [ ... 
'doi = {10.1139/z85-125}, ' ...
'author = {T. D. Beacham and C. Withler and R. B. Morly}, ' ... 
'year = {1985}, ' ...
'title = {Effect of egg size on incubation time and alevin and fry size in chum salmon (\emph{Oncorhynchus keta}) and coho salmon (\emph{Oncorhynchus kisutch})}, ' ...
'journal = {Canadian Journal of Zoology}, ' ...
'volume = {63}, ' ...
'pages = {847-850}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Oncorhynchus-kisutch.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'usgs'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.usgs.gov/faqs/why-do-salmon-eggs-come-different-colors?qt-news_science_products=0#qt-news_science_products}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
