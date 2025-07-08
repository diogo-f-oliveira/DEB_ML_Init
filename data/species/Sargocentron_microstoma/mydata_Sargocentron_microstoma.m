function [data, auxData, metaData, txtData, weights] = mydata_Sargocentron_microstoma

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Holocentriformes'; 
metaData.family     = 'Holocentridae';
metaData.species    = 'Sargocentron_microstoma'; 
metaData.species_en = 'Smallmouth squirrelfish';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp','jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz','jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwi'; 'Ri'; 'rB'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 11 06];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 06];

%% set data
% zero-variate data

data.ab = 3.3;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(27.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27.8); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 9;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
data.Li  = 20;    units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.68e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.8 mm: pi/6*0.08^3';
data.Wwp = 15.6;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.01585*Lp^3.138, see F1';
data.Wwi = 197;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based from 0.01585*Li^3.138, see F1';

data.Ri  = 8.8e3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27.8);  units.temp.Ri = 'K';  label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Holocentrus_adscensionis: 249863*(20/61)^3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), std length (cm)
70.459	5.721
103.103	7.041
133.574	6.750
164.150	8.475
195.860	7.914
226.871	9.975
365+15.318	13.425
365+74.270	14.727
365+134.848	15.153
365+165.333	15.130
365+195.453	16.116
365+227.970	15.017
365+258.107	16.339
365+288.596	16.384
365+349.615	17.280];
data.tL(:,1) = data.tL(:,1) + 0; % set origin ar birth
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'std length'};  
temp.tL    = C2K(27.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
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
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01585*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9369D'; % Cat of Life
metaData.links.id_ITIS = '166262'; % ITIS
metaData.links.id_EoL = '46567271'; % Ency of Life
metaData.links.id_Wiki = 'Sargocentron_microstoma'; % Wikipedia
metaData.links.id_ADW = 'Sargocentron_microstoma'; % ADW
metaData.links.id_Taxo = '94412'; % Taxonomicon
metaData.links.id_WoRMS = '217952'; % WoRMS
metaData.links.id_fishbase = 'Sargocentron-microstoma'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sargocentron_microstoma}}';
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
'howpublished = {\url{https://www.fishbase.de/summary/Sargocentron-microstoma.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

