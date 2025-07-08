function [data, auxData, metaData, txtData, weights] = mydata_Symsagittifera_roscoffensis

%% set metaData
metaData.phylum     = 'Xenacoelomorpha'; 
metaData.class      = 'Acoelomorpha'; 
metaData.order      = 'Acoela'; 
metaData.family     = 'Sagittiferidae';
metaData.species    = 'Symsagittifera_roscoffensis'; 
metaData.species_en = 'Mint-sauce Worm'; 
metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0iMb', '0iMi'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biB', 'jiAa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 24];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 24]; 

%% set data
% zero-variate data

data.ab = 4;    units.ab = 'd';    label.ab = 'age at birth';                 bibkey.ab = 'Doug1983b';
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 110;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 365;   units.am = 'd';    label.am = 'life span';                   bibkey.am = 'guess';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.028; units.Lb  = 'cm';  label.Lb  = 'body length at birth';      bibkey.Lb  = 'Doug1983';
data.Lp  = 0.9;   units.Lp  = 'cm';  label.Lp  = 'body length at puberty';    bibkey.Lp  = 'guess';
data.Li  = 1.5;   units.Li  = 'cm';  label.Li  = 'ultimate  body length';     bibkey.Li  = 'Wiki';

data.Wwb = 4.2e-6; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
   comment.Wwb = 'based on guessed egg diameter of 200 mum: pi/6*0.02^3';
data.Wwp = 5e-3; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';       bibkey.Wwp = 'guess';
   comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 0.0231;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on body width of 0.14 cm: pi/4*0.14^2*Li';

data.Ri  = 15; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate';      bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on kap = 0.8; produces capsules with 5 - 30 embryos';
 
% uni-variate data

% time-length data
data.tL = [ ... % time since birth (d), body length (cm)
0.000	0.028
9.901	0.033
19.988	0.041
29.778	0.059];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'body length'};  
temp.tL   = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Doug1983';
comment.tL = 'temp is guessed';

  
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
D1 = 'Metabolic acceleration is here linked to establisment of internal algal symbiont population';
D2 = 'Reproduction efficiency kap_R has been set to 0.95/2 because the species is simultaneous hermaphroditic';
metaData.discussion = struct('D1', D1,'D2',D2);

%% Facts
F1 = 'Neonates have no symbionts. Juveniles only ingested the geen alga Platymonas convoluta (Volvocaceae) as symbiont; the algae take 2-3 d to increase amd migrate throught the body without thecae and in 15-20 d the animal is uniformly green';
metaData.bibkey.F1 = 'Doug1983'; 
F2 = 'Food uptake by phagocytosis';
metaData.bibkey.F2 = 'Doug1983'; 
F3 = 'host supplies symbionts with uric acid';
metaData.bibkey.F3 = 'Doug1983a'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '53SQ2'; % Cat of Life
metaData.links.id_ITIS = '1043618'; % ITIS
metaData.links.id_EoL = '46587293'; % Ency of Life
metaData.links.id_Wiki = 'Symsagittifera_roscoffensis'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '201059'; % Taxonomicon
metaData.links.id_WoRMS = '484585'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/https://en.wikipedia.org/wiki/Symsagittifera_roscoffensis}}';
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
bibkey = 'Doug1983'; type = 'Article'; bib = [ ... 
'author = {A. E. DOUGLAS}, ' ... 
'year = {1983}, ' ...
'title = {ESTABLISHMENT OF THE SYMBIOSIS IN \emph{Convoluta roscoffensis}}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {63}, ' ...
'pages = {419--434}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Doug1983a'; type = 'Article'; bib = [ ... 
'author = {A. E. DOUGLAS}, ' ... 
'year = {1983}, ' ...
'title = {URIC ACID UTILIZATION IN PLATYMONAS CONVOLUTAE AND SYMBIOTIC \emph{Convoluta roscoffensis}}, ' ...
'journal = {J. mar. biol. Ass. U.K.}, ' ...
'volume = {63}, ' ...
'pages = {435--447}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Doug1983b'; type = 'Article'; bib = [ ... 
'author = {A. E. DOUGLAS}, ' ... 
'year = {1983}, ' ...
'title = {Experimental studies on egg production by \emph{Convoluta roscoffensis}: {G}raff, 1882 ({T}urbellaria, {A}coela)}, ' ...
'journal = {Hydrobiologia}, ' ...
'volume = {102}, ' ...
'pages = {151--154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

