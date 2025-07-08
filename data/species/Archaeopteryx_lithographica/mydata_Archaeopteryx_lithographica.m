function [data, auxData, metaData, txtData, weights] = mydata_Archaeopteryx_lithographica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Theropoda'; 
metaData.family     = 'Archaeopterygidae';
metaData.species    = 'Archaeopteryx_lithographica'; 
metaData.species_en = 'Archaeopteryx'; 

metaData.ecoCode.climate = {'Df'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTi', '0iTf'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 10 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 27]; 

%% set data
% zero-variate data

data.tp = 2.5*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'EricRauh2009';
  temp.tp = C2K(37);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;    units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(37);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Ww0 = 39.6; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';             bibkey.Ww0 = 'EricRauh2009';
data.Wwb = 30; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'EricRauh2009';
data.Wwi = 900; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'EricRauh2009';

data.Ri  = 4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';         bibkey.Ri  = 'guess';   
  temp.Ri = C2K(37);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Very speculative';
 
% uni-variate data
% time-weight
data.tW = [ ... % time since birth (d), wet weight (g)
116.449	116.900
270.684	254.958
331.226	346.818
347.764	299.178
352.315	312.556
403.758	379.568
461.421	564.928
523.512	683.511];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(37);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'EricRauh2009';
comment.tW = 'Temperature is speculative; weights reconstructured from bone lengths';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Neonate growth is possibly retarted by lower body temperature';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Extinct, lived around 150 Ma ago';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = ''; % Cat of Life not present 2021/08/08
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '52571635'; % Ency of Life
metaData.links.id_Wiki = 'Archaeopteryx_lithographica'; % Wikipedia
metaData.links.id_Taxo = '51227'; % Taxonomicon
metaData.links.id_avibase = '76B6FC8B4372AA35'; % Avibase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Archaeopteryx}}';
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
bibkey = 'EricRauh2009'; type = 'Article'; bib = [ ... 
'author = {G. M. Erickson and O. W. M. Rauhut and Z. Zhou and A. H. Turner and B. D. Inouye1 and D. Hu and M. A. Norell}, ' ... 
'year = {2009}, ' ...
'title = {Was Dinosaurian Physiology Inherited by Birds? {R}econciling Slow Growth in \emph{Archaeopteryx}}, ' ...
'journal = {Plos One}, ' ...
'volume = {4}, ' ...
'pages = {e7390}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

