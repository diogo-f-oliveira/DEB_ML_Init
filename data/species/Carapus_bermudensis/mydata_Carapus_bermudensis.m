function [data, auxData, metaData, txtData, weights] = mydata_Carapus_bermudensis 

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Ophidiiformes'; 
metaData.family     = 'Carapidae';
metaData.species    = 'Carapus_bermudensis'; 
metaData.species_en = 'Atlantic pearlfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'jiTie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2014 06 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

% for curators only ------------------------------
metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 08 25]; 
% -------------------------------------------------


%% set data
% zero-variate data

data.ab = 1;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;     units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

%data.L0  = 0.05;   units.L0  = 'cm';  label.L0  = 'egg diameter';             bibkey.L0  = 'guess';  
data.Lb  = 0.1;    units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'guess';  
data.Lp  = 18.7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'SmitTyle1981'; 
  comment.Lp = 'SmitTyle1981 gives maturity for C.bermudensis at 90% of max headlength; stage IV - VII are adult';
data.Li  = 20.8;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwi = 15;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'GlynEnoc2008';
  comment.Wwi = 'based on (20.8/9.7)^3 * 1.534 for C.mourlani: GlynEnoc2008 gives 1.534 g for a 9.7 cm fish (total length)';

data.Ri  = 1e6/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
temp.Ri = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data from SmitTyle1981 at 26C
data.tL = [ ... % time (yr), head-length (cm)
0.610	0.452
0.766	0.508
1.006	0.590
1.282	0.790
1.611	0.929
1.764	1.060
2.005	1.137
2.272	1.232
3.615	1.240
4.766	1.423
3.006	1.435
3.276	1.508
3.614	1.695
4.002	1.719
4.282	1.889];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'head length'};  bibkey.tL = 'SmitTyle1981';
temp.tL    = C2K(26);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
comment.tL = 'these head-lengths are after metamorphosis'; 
  
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

%% Facts
F1 = ['Larva develops in vexillifer with a long dorsal filament colled vexillem. ', ...
      'This filament disappear: the long slender tenuis stage. ', ...
      'After a planktontic period the tenuis enters their holothurian host and shrink to 1/3 of its size. ', ...
      'Tip of tail frequently missing: size in head-length.'];
metaData.bibkey.F1 = 'SmitTyle1981'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'R2YM'; % Cat of Life
metaData.links.id_ITIS = '165096'; % ITIS
metaData.links.id_EoL = '46565417'; % Ency of Life
metaData.links.id_Wiki = 'Carapus'; % Wikipedia
metaData.links.id_ADW = 'Carapus_bermudensis'; % ADW
metaData.links.id_Taxo = '165436'; % Taxonomicon
metaData.links.id_WoRMS = '158995'; % WoRMS
metaData.links.id_fishbase = 'Carapus-bermudensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Carapus}}';
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
bibkey = 'GonzMagg2014'; type = 'Article'; bib = [ ... 
'author = {M. Gonz\''{a}lez-Wang\"{u}emert and C. Maggi and S. Valente and J. Mart\''{i}nez-Garrido and N. Vasco Rodrigues}, ' ... 
'year = {2014}, ' ...
'title = {\emph{Parastichopus regalis}: The main host of \emph{Carapus acus} in temperate waters of the {M}editerranean {S}ea and {N}ortheastern {A}tlantic {O}cean}, ' ...
'journal = {SPC Beche-de-mer Information Bulletin}, ' ...
'volume = {34}, ' ...
'number = {May 201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'GlynEnoc2008'; type = 'Article'; bib = [ ... 
'author = {P. W. Glynn and I. C. Enochs and J. E. McCosker and A. N. Graefe}, ' ... 
'year = {2008}, ' ...
'title = {First Record of a Pearlfish, \emph{Carapus mourlani}, Inhabiting the {A}plysiid {O}pisthobranch Mollusc \emph{Dolabella auricularia}}, ' ...
'journal = {Pacific Science}, ' ...
'volume = {62}, ' ...
'pages = {593-601}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SmitTyle1981'; type = 'Article'; bib = [ ... 
'author = {C. L. Smith and J. C. Tyler and M. N. Feinberg}, ' ... 
'year = {1981}, ' ...
'title = {Population ecology and biology of the pearlfish (\emph{Carapus bermudensis}) in the lagoon at {B}imini, {B}ahamas}, ' ...
'journal = {Bull. Mar. Sci.}, ' ...
'volume = {31}, ' ...
'pages = {876--902}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/1785}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
