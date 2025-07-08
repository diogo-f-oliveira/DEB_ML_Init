function [data, auxData, metaData, txtData, weights] = mydata_Octopus_vulgaris

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Cephalopoda'; 
metaData.order      = 'Octopoda'; 
metaData.family     = 'Octopodidae';
metaData.species    = 'Octopus_vulgaris'; 
metaData.species_en = 'Common octopus'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0jMc', 'jiMb'};
metaData.ecoCode.embryo  = {'Mc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab_T'; 'as'; 'ap'; 'am'; 'Lb'; 'Wdb'; 'Wds'; 'Wwp'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-Ww'; 't-Wd'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Jonathan Flye-Sainte-Marie'};    
metaData.date_subm = [2013 04 16];              
metaData.email    = {'jonathan.flye@univ-brest.fr'};            
metaData.address  = {'University of Brest'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2013 08 22];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 01 15]; 

%% set data
% zero-variate data

data.ab_22 = 37;   units.ab_22 = 'd'; label.ab_22 = 'age at birth';         bibkey.ab_22 = 'CaveDoma1999';   
  temp.ab_22 = C2K(22);  units.temp.ab_22 = 'K'; label.temp.ab_22 = 'temperature';
data.ab_18 = 47;   units.ab_18 = 'd'; label.ab_18 = 'age at birth';          bibkey.ab_18 = 'IgleOter2004';   
  temp.ab_18 = C2K(18);  units.temp.ab_18 = 'K'; label.temp.ab_18 = 'temperature';
data.ts = 40;      units.ts = 'd';    label.ts = 'time since birth at settlement'; bibkey.ts = 'IgleOter2004';   
  temp.ts = C2K(22.5);   units.temp.ts = 'K'; label.temp.ts = 'temperature';
  comment.ts = 'for O. vulgaris';
data.tp = 150;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'SilvSobr2002';
  temp.tp = C2K(18);     units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 240;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'IgleOter2004';   
  temp.am = C2K(18);     units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.15;   units.Lb  = 'cm';  label.Lb  = 'mantle length at birth';  bibkey.Lb  = 'IgleSanc2007';

data.Wdb = 3.4e-4; units.Wdb = 'g';   label.Wdb = 'dry weight at birth';     bibkey.Wdb = {'IgleOter2004','VillRiba2004'};
data.Wds = 0.0095; units.Wds = 'g';   label.Wds = 'dry weight at settlement'; bibkey.Wds = 'IgleOter2004';
data.Wwp = 1000;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'SilvSobr2002';
data.Wwi = 1800;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'IgleOter2004';

data.Ni  = 1.12e5; units.Ni  = '#';   label.Ni  = 'cum reprod at death';     bibkey.Ni  = 'IgleOter2004';   
  temp.Ni = C2K(20);    units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = 'at Monterey Bay';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
    120 13.5353074164;
 	150 235.717599582;
 	180 587.214363038;
 	210 1019.92297099;
 	240 1618.04511278];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(18);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'IgleOter2004';

% t-W data for Paralarva
data.tWd_para1 = [ ... % time since birth (d), dry weight (g)
    0.993377483444  0.000349030470914;
	18.0227057711  0.00151246537396;
	33.0179754021  0.00528531855956;
	41.0122989593  0.00703047091413;
	46.0264900662  0.00950692520776	];
units.tWd_para1   = {'d', 'g'};  label.tWd_para1 = {'time since birth', 'dry weight', 'IgleOter2004'};  
temp.tWd_para1    = C2K(22.5);  units.temp.tWd_para1 = 'K'; label.temp.tWd_para1 = 'temperature';
bibkey.tWd_para1 = 'IgleOter2004';

% time - dry weight
data.tWd_para2 = [ ... % time since birth (d), dry weight (g)
1	0.0003;
10	0.0007;
20	0.00135;
30	0.00338;
40	0.0061;
60	0.02202;
1	0.0003;
10	0.00084;
20	0.001178;
30	0.00376;
40	0.00672;
1	0.00032;
10	0.00082;
20	0.00162;
30	0.00339;
40	0.0057;
50	0.0062;
53	0.0092];
[~, ind] = sort(data.tWd_para2(:,1)); data.tWd_para2 = data.tWd_para2(ind,:);
n=size(data.tWd_para2,1); for i=2:n; if data.tWd_para2(i,1)<=data.tWd_para2(i-1,1); data.tWd_para2(i,1)=data.tWd_para2(i-1,1)+1e-8;end;end
units.tWd_para2   = {'d', 'g'};  label.tWd_para2 = {'time since birth', 'dry weight', 'CarrArro2006'};  
temp.tWd_para2    = C2K(21.2);  units.temp.tWd_para2 = 'K'; label.temp.tWd_para2 = 'temperature';
bibkey.tWd_para2 = 'CarrArro2006';

% time-length
data.tL_para2 = [ ... % 	d (time since birth) length(cm)
1	0.219;
10	0.285;
20	0.336;
30	0.427;
40	0.54;
60	0.654;
1	0.219;
10	0.296;
20	0.342;
30	0.435;
40	0.552;
1	0.209;
10	0.306;
20	0.339;
30	0.43;
40	0.48;
50	0.5;
53	0.61];
[~, ind] = sort(data.tL_para2(:,1)); data.tL_para2 = data.tL_para2(ind,:);
n=size(data.tL_para2,1); for i=2:n; if data.tL_para2(i,1)<=data.tL_para2(i-1,1); data.tL_para2(i,1)=data.tL_para2(i-1,1)+1e-8;end;end
units.tL_para2   = {'d', 'cm'};  label.tL_para2 = {'time since birth', 'mantle length'};  
temp.tL_para2    = C2K(21.2);  units.temp.tL_para2 = 'K'; label.temp.tL_para2 = 'temperature';
bibkey.tL_para2 = 'CarrArro2006';

%% set weights for all real data
weights = setweights(data, []);
%weights.tWd_para2(end) = 0 * weights.tWd_para2(end);
weights.tWd_para2 = 0 * weights.tWd_para2;
weights.Ni = 10 * weights.Ni;
weights.Wwi = 10 * weights.Wwi;
weights.Wdb = 0 * weights.Wdb;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tWd_para1','tWd_para2'}; subtitle1 = {'Data from IgleOter2004, CarrArro2006'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'z is not well-fixed by data, size ultimate size is much larger than size at death';
D2 = 'in view of fitting results, puberty does not coincide with mating and part of structure converts to eggs just before death';
D3 = 'model abj has been used, meaning that settlement has no effect on acceleration';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'semelparous: death at first spawning, female ventilates eggs and dies after hatching; No food intake during this period';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'small eggs with a planktontic larval stage';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'males and females grow at the same rate; males mature before females';
metaData.bibkey.F3 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '48KQY'; % Cat of Life
metaData.links.id_ITIS = '82603'; % ITIS
metaData.links.id_EoL = '492280'; % Ency of Life
metaData.links.id_Wiki = 'Octopus_vulgaris'; % Wikipedia
metaData.links.id_ADW = 'Octopus_vulgaris'; % ADW
metaData.links.id_Taxo = '40350'; % Taxonomicon
metaData.links.id_WoRMS = '140605'; % WoRMS
metaData.links.id_molluscabase = '140605'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Octopus_vulgaris}}';
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
bibkey = 'CaveDoma1999'; type = 'Article'; bib = [ ... 
'author = {Caveriviere, A. and Domain, F. and Diallo, A.}, ' ... 
'year = {1999}, ' ...
'title = {Observations on the influence of temperature on the length of embryonic development in \emph{Octopus vulgaris} ({S}enegal)}, ' ...
'journal = {Aquat. Living Resour.}, ' ...
'volume = {12}, ' ...
'pages = {151--154}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IgleOter2004'; type = 'Article'; bib = [ ... 
'author = {Iglesias, J. and Otero, J. and Moxica, C. and Fuentes, L. and Sanchez, F.}, ' ... 
'year = {2004}, ' ...
'title = {The completed life cycle of the octopus (\emph{Octopus vulgaris} {C}uvier) under culture conditions: paralarval rearing using artemia and zoeae, and first data on juvenile growth up to 8 months of age}, ' ...
'journal = {Aquacult. Int.}, ' ...
'volume = {12}, ' ...
'pages = {481-487}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SilvSobr2002'; type = 'Article'; bib = [ ... 
'author = {Silva, L. and Sobrino, I. and Ramos, F.}, ' ... 
'year = {2002}, ' ...
'title = {Reproductive biology of the common octopus, \emph{Octopus vulgaris} {C}uvier, 1797 ({C}ephalopoda: {O}ctopodidae) in the {G}ulf of {C}adiz ({S}{W} {S}pain)}, ' ...
'journal = {Bulletin of marine science}, ' ...
'volume = {71}, ' ...
'pages = {837--850}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'IgleSanc2007'; type = 'Article'; bib = [ ... 
'author = {Iglesias, J. and Sanchez, F. and Bersano, J and et al.}, ' ... 
'year = {2007}, ' ...
'title = {Rearing of \emph{Octopus vulgaris} paralarvae: {P}resent status, bottlenecks and trends}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {266}, ' ...
'pages = {1-15}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VillRiba2004'; type = 'Article'; bib = [ ... 
'author = {Villanueva, R. and Riba, J. and Ruaz-Capillas, C. and Gonzalez, A. and Baeta, M.}, ' ... 
'year = {2004}, ' ...
'title = {Amino acid composition of early stages of cephalopods and effect of amino acid dietary treatments on \emph{Octopus vulgaris} paralarvae}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {242}, ' ...
'pages = {455--478}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CarrArro2006'; type = 'Article'; bib = [ ... 
'author = {Carrasco, J. F. and Arronte, J. C. and Rodriguez, C.}, ' ... 
'year = {2006}, ' ...
'title = {Paralarval rearing of the common octopus, \emph{Octopus vulgaris} ({C}uvier)}, ' ...
'doi = {10.1111/j.1365-2109.2006.01594.x}, ' ...
'journal = {Aquaculture Research}, ' ...
'volume = {37}, ' ...
'pages = {1601-1605}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

