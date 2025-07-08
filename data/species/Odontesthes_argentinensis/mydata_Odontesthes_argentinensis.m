function [data, auxData, metaData, txtData, weights] = mydata_Odontesthes_argentinensis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Odontesthes_argentinensis'; 
metaData.species_en = 'Pejerrey'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMcp', '0iMm', 'jiFr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 03 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 09]; 

%% set data
% zero-variate data

data.am = 7*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'LlomCola2013';   
  temp.am = C2K(15.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 16.1;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase'; 
  comment.Lp = 'based on "reserve accumulation in winter", combined with tL data';
data.Li  = 42.1;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 2.2e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'EPA2002';
  comment.Wwb = 'based of egg diameter of 0.75 mm for Menidia_beryllina: pi/6*0.075^3';
data.Wwp  = 26;  units.Wwp  = 'g';  label.Wwp  = 'wet weight at puberty';    bibkey.Wwp  = 'fishbase';
  comment.Wwp = 'baes on 0.00575*Lp^3.03, see F1';
data.Wwi  = 480;  units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'fishbase';
  comment.Wwi = 'baes on 0.00575*Li^3.03, see F1';

data.Ri = 1e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'LlomCola2013';   
  temp.Ri = C2K(15.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'for females of TL  21.2 to 34.2 cm, mean 27.5 cm';

% uni-variate data
% time-length
data.tL = [ ... time since birth (yr), total length (cm)
0.000	0.322
0.766	7.889
1.744	20.367
2.741	28.417
3.748	33.005
4.727	35.340
5.744	37.513
6.761	38.962];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(15.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LlomCola2013';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '74HMS'; % Cat of Life
metaData.links.id_ITIS = '630870'; % ITIS
metaData.links.id_EoL = '46566583'; % Ency of Life
metaData.links.id_Wiki = 'Odontesthes'; % Wikipedia
metaData.links.id_ADW = 'Odontesthes_argentinensis'; % ADW
metaData.links.id_Taxo = '181637'; % Taxonomicon
metaData.links.id_WoRMS = '281824'; % WoRMS
metaData.links.id_fishbase = 'Odontesthes-argentinensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Odontesthes}}'];
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
bibkey = 'LlomCola2013'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2012.03494.x}, ' ...
'author = {F. M. Llompart and D. C. Colautti and T. Maiztegui and A. M. Cruz-Jim\''{e}nez and C. R. M. Baig\''{u}n}, ' ... 
'year = {2013}, ' ...
'title = {Biological traits and growth patterns of pejerrey \emph{Odontesthes argentinensis}}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {82}, ' ...
'pages = {458-474}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Odontesthes-argentinensis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EPA2002'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {EPA}, ' ...
'year = {2002}, ' ...
'title  = {Short-term methods for estimating the chronic toxicity of effluents and receiving waters to marine and estuarine organsims}, ' ...
'volume = {EPA-821-R-02-014}, ' ...
'publisher = {U.S. EPA, Washington}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

