  function [data, auxData, metaData, txtData, weights] = mydata_Lile_stolifera
%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Dorosomatidae';
metaData.species    = 'Lile_stolifera'; 
metaData.species_en = 'Striped herring '; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMpe', 'piFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 30];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 30];

%% set data
% zero-variate data
data.am = 5*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 10.6;     units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on Tenualosa_ilisha: 15.9*2/3';
data.Li = 15.9 ;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.7 mm: pi/6*0.07^3';
data.Wwp = 14.4;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'fishbase','guess'};
  comment.Wwi = 'based on 0.01023*Lp^3.07, see F1';
data.Wwi = 50;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.07, see F1; max published weight 34.85 g';
  
data.Ri = 6.6e4/365;units.Ri = '#/d';  label.Ri = 'max reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(25.6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Tenualosa_ilisha: (15.9/45)^3*1.5e6';
  
% uni-variate data

% time-length
data.tL = [ ... % time since birth (d), total length (cm)
105.832	4.660
165.878	6.934
186.660	6.924
212.713	7.498
281.716	8.722
329.817	9.034
355.837	9.357
394.847	9.674];
data.tL(:,1) = data.tL(:,1)+50; % set origin at birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature'; 
bibkey.tL = 'Warb1979';

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
D1 = 'Temeratures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^3.07';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6PYMG'; % Cat of Life
metaData.links.id_ITIS = '551246'; % ITIS
metaData.links.id_EoL = '46562537'; % Ency of Life
metaData.links.id_Wiki = 'Lile_stolifera'; % Wikipedia
metaData.links.id_ADW = 'Lile_stolifera'; % ADW
metaData.links.id_Taxo = '178822'; % Taxonomicon
metaData.links.id_WoRMS = '281353'; % WoRMS
metaData.links.id_fishbase = 'Lile-stolifera'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Lile_stolifera}}';  
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
bibkey = 'Warb1979'; type = 'article'; bib = [ ...  
'doi = {10.1111/j.1095-8649.1979.tb03542.x}, ' ...
'author = {K. Warburton}, ' ...
'year = {1979}, ' ...
'title  = {Growth and production of some important species of fish in a {M}exican coastal lagoon system}, ' ...
'journal = {J. Fish Biol.}, ' ...
'volume = {14(5)}, ' ...
'pages = {449–464}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Lile-stolifera.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
