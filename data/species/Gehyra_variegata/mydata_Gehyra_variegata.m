function [data, auxData, metaData, txtData, weights] = mydata_Gehyra_variegata

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Gekkonidae';
metaData.species    = 'Gehyra_variegata';
metaData.species_en = 'Tree dtella';

metaData.ecoCode.climate = {'Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_f'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 09];

%% set data
% zero-variate data;
data.ab = 65;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'Bust2009';
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '61-79 d';
data.am = 5*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'Wiki';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 2.4; units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Bust2009';  
  comment.Lb = '2.3-2.5 cm; Wiki: TL 4.5 cm';
data.Lp  = 4.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Bust2009';  
data.Li  = 5.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';    bibkey.Li  = 'Bust2009';
data.Lim  = 8.5;  units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';    bibkey.Lim  = 'Bust2009';

data.Wwi = 8.46; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Bust2009';
temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 eggs per clutch, 2 clutches per yr';

% univariate data
% time - length
data.tL = [ ... % time (d), SVL (cm)
28.473	2.695
59.017	2.795
88.484	3.016
88.985	2.908
150.009	3.027
272.463	3.035
363.310	3.832
392.590	3.814
365+28.951	3.306 % females
365+87.903	3.773
365+239.688	3.829
365+271.905	3.821
365+301.291	3.939
365+330.308	4.335
365+362.034	4.448

365+56.969	3.923 % male
365+88.017	3.919
365+117.389	4.019
365+149.609	4.015
365+178.328	4.030
365+208.794	4.030
365+240.432	4.031
365+300.940	4.240];
data.tL(:,1) = data.tL(:,1)+50; % set origin at hatch
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL', 'Bust2009'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bust2009'; 

data.tL1 = [ ...
0.082	2.776
0.254	3.050
0.744	3.503
0.923	3.785
1.088	4.098
1.254	4.028
1.593	4.075
1.737	4.286
1.910	4.403
2.082	4.466
2.414	4.646
2.593	4.685
2.752	4.693
2.925	4.677
3.083	4.826
3.595	4.787
3.754	4.826
3.933	4.803
4.085	4.881];
data.tL1(:,1) = data.tL1(:,1) * 365; % convert yr to d
units.tL1  = {'d', 'cm'};  label.tL1 = {'time since birth', 'SVL', 'KitcHow1988'};  
temp.tL1   = C2K(24);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'KitcHow1988'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tL1 = 3 * weights.tL1;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data by Bust2009, KitcHow1988'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '3FGNG'; % Cat of Life
metaData.links.id_ITIS = '818554'; % ITIS
metaData.links.id_EoL = '794417'; % Ency of Life
metaData.links.id_Wiki = 'Gehyra_variegata'; % Wikipedia
metaData.links.id_ADW = 'Gehyra_variegata'; % ADW
metaData.links.id_Taxo = '90867'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Gehyra&species=variegata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Feeding was restricted to six to seven months of the year';
metaData.bibkey.F1 = 'Bust2009'; 
metaData.facts = struct('F1',F1);

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Gehyra_variegata}}';   
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
bibkey = 'Bust2009'; type = 'Article'; bib = [ ...
'doi = {10.1111/j.1469-7998.1968.tb05041.x}, ' ...
'author = {H. Robert Bustard}, ' ...
'title = {The ecology of the {A}ustralian gecko, \emph{Gehyra variegata}, in northern {N}ew {S}outh {W}ales}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {154(1)}, ' ...
'pages = {113–138}, ' ...
'year = {2009}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/794417}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KitcHow1988'; type = 'Article'; bib = [ ...
'author = {D. J. Kitchener and R. A. How and J. Dell}, ' ...
'title = {Biology of \emph{Oedura reticulata} and \emph{Gehyra variegata} ({G}ekkonidae) in an Isolated Woodland of {W}estern {A}ustralia}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {22(4)}, ' ...
'pages = {401-412}, ' ...
'year = {1988}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

