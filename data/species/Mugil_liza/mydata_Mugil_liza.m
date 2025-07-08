function [data, auxData, metaData, txtData, weights] = mydata_Mugil_liza

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Mugiliformes'; 
metaData.family     = 'Mugilidae';
metaData.species    = 'Mugil_liza'; 
metaData.species_en = 'Lebranche mullet';

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'jiFm', '0iMm'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mdc'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'R_i'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 16]; 

%% set data
% zero-variate data

data.ab = 2; units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'MontBone2001';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 23*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'Leij2006: females become older than males';
  
data.Lp  = 35;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
data.Li  = 69;     units.Li  = 'cm';  label.Li  = 'ultimate total length for female';    bibkey.Li  = 'fishbase';
data.Lim  = 80;     units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male';    bibkey.Lim  = 'fishbase';

data.Wwb = 3.8e-4;   units.Wwb = 'g';   label.Wwb = 'ultimate wet weight';      bibkey.Wwb = 'MontBone2001';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3';
data.Wwi = 2.9e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01000*Li^2.97, see F1';
data.Wwim = 4.5e3;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';      bibkey.Wwim = 'fishbase';
  comment.Wwim = 'based on 0.01000*Lim^2.97, see F1';
  
data.Ri  = 4e6/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate '; bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '"spawns several million eggs"';
  
% uni-variate data
% t-L data
data.tL = [ ... % yr class (yr), total length (cm)
1.277	27.973
2.391	30.541
3.458	39.189
4.642	42.162
5.710	46.622
6.754	49.054
7.892	50.676
8.959	54.324
10.027	56.351
11.118	55.946];
data.tL(:,1) = (data.tL(:,1) + .5) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  bibkey.tL = 'GarbCast2014';
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Ww in g = 0.01000*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '44J6J'; % Cat of Life
metaData.links.id_ITIS = '170338'; % ITIS
metaData.links.id_EoL = '46571524'; % Ency of Life
metaData.links.id_Wiki = 'Mugil_liza'; % Wikipedia
metaData.links.id_ADW = 'Mugil_liza'; % ADW
metaData.links.id_Taxo = '180429'; % Taxonomicon
metaData.links.id_WoRMS = '273655'; % WoRMS
metaData.links.id_fishbase = 'Mugil-liza'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mugil_liza}}';
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
bibkey = 'GarbCast2014'; type = 'Article'; bib = [ ... 
'author = {T. Garbina and J. Pablo Castello and P. Gerhard Kinas}, ' ... 
'year = {2014}, ' ...
'title = {Age, growth, and mortality of the mullet \emph{Mugil liza} in {B}razil''s southern and southeastern coastal regions}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {149}, ' ...
'pages = {61-68}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MontBone2001'; type = 'Article'; bib = [ ... 
'author = {Wanda Maria Monteiro-Ribas and Ana Cristina Teixeira Bonecker}, ' ... 
'year = {2001}, ' ...
'title = {Artificial fertilization and development in laboratory of \emph{Mugil Liza} ({V}alenciennes, 1836) ({O}steichthyes, {M}ugilidae)}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'volume = {68}, ' ...
'pages = {427-433}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Mugil-liza.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

