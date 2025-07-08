function [data, auxData, metaData, txtData, weights] = mydata_Astropecten_irregularis
%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Asteroidea'; 
metaData.order      = 'Paxillosida'; 
metaData.family     = 'Astropectinidae';
metaData.species    = 'Astropecten_irregularis'; 
metaData.species_en = 'Sand sea star'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz', 'bjCim'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 25];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 25]; 


%% set data
% zero-variate data

data.tj = 30;   units.tj = 'd';      label.tj = 'time since birth at metam'; bibkey.tj = 'marlin';   
  temp.tj = C2K(14);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'all temps guessed';
data.tp = 2.5*365;  units.tp = 'd';      label.tp = 'time since birth at puberty'; bibkey.tp = 'marlin';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365; units.am = 'd';      label.am = 'life span';                 bibkey.am = 'marlin';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 0.5;   units.Lj  = 'cm';  label.Lj  = 'arm length at metam';        bibkey.Lj  = 'FreeRich2001';
data.Lp  = 2.4;   units.Lp  = 'cm';  label.Lp  = 'arm length at puberty';      bibkey.Lp  = 'FreeRich2001';
data.Li  = 6.6;   units.Li  = 'cm';  label.Li  = 'ultimate arm length';        bibkey.Li  = 'FreeRich2001';

data.Wwb  = 4.2e-6; units.Wwb  = 'g';  label.Wwb  = 'wet weight at birth';     bibkey.Wwb  = 'marlin';
  comment.Wwb = 'based on egg diameter 0f 200 mum: pi/6*0.02^3';
data.Wwp  = 4.7; units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';      bibkey.Wwp  = 'FreeRich2001';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi  = 97; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';        bibkey.Wwi  = 'RobiGree2010';
  comment.Wwi = 'based on arm+disk length of 124.55 mm';

data.GSI  = 0.42;  units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'FreeRich2001';   
  temp.GSI = C2K(14);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% univariate data

% time-length
data.tL = [... % time (d), modal arm length (cm) 
 0.000	1.748
30.450	1.812
60.500	1.770
90.588	1.908
120.638	1.866
150.704	1.898
180.850	2.303
244.225	2.473
274.292	2.516
305.455	2.655
334.490	2.889
365.716	3.326
393.701	3.667
487.119	3.763
518.263	3.817
548.335	3.881
608.462	3.923
637.470	4.030
669.745	4.350
699.822	4.435
730.945	4.392
761.022	4.478
792.155	4.478
851.215	4.552
882.354	4.584
912.436	4.691
945.724	4.733];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'model arm length'};  
temp.tL   = C2K(14);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'FreeRich2001';
comment.tL = 'data from Red Wharf Bay';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'dioecious, which means that each individual is either male or female';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'weight-length: weight (g): 0.03972 * (diameter in cm)^3.144';
metaData.bibkey.F2 = 'sealifebase'; 
metaData.facts = struct('F1',F1,'F2',F2);  

%% Links
metaData.links.id_CoL = '5VVTS'; % Cat of Life
metaData.links.id_ITIS = '156909'; % ITIS
metaData.links.id_EoL = '45327535'; % Ency of Life
metaData.links.id_Wiki = 'Astropecten_irregularis'; % Wikipedia
metaData.links.id_ADW = 'Astropecten_irregularis'; % ADW
metaData.links.id_Taxo = '40829'; % Taxonomicon
metaData.links.id_WoRMS = '123868'; % WoRMS


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Astropecten_irregularis}}';
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
bibkey = 'FreeRich2001'; type = 'Article'; bib = [ ... 
'author = {S. M. Freemana and C. A. Richardson and R. Seed}, ' ... 
'year = {2001}, ' ...
'title = {Seasonal Abundance, Spatial Distribution, Spawning and Growth of \emph{Astropecten irregularis} ({E}chinodermata: {A}steroidea)}, ' ...
'journal = {Estuarine, Coastal and Shelf Science}, ' ...
'volume = {53}, ' ...
'pages = {39-49}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RobiGree2010'; type = 'Article'; bib = [ ... 
'author = {L. A. Robinson and S. P. R. Greenstreet and H. Reiss and R. Callaway and J. Craeymeersch and I. de Boois and S. Degraer and S. Ehrich and H. M. Fraser and A. Goffin and I. Kroncke and L. L. Jorgenson and M. R. Robertson and J. Lancaster}, ' ... 
'year = {2010}, ' ...
'title = {Lengthweight relationships of 216 {N}orth {S}ea benthic invertebrates and fish}, ' ...
'journal = {Journal of the Marine Biological Association of the United Kingdom}, ' ...
'volume = {90}, ' ...
'pages = {95-104}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'marlin'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.marlin.ac.uk/biotic/browse.php?sp=6097}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.sealifebase.org/summary/Astropecten-irregularis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];