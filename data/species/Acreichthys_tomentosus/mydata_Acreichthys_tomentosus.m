function [data, auxData, metaData, txtData, weights] = mydata_Acreichthys_tomentosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Tetraodontiformes'; 
metaData.family     = 'Monacanthidae';
metaData.species    = 'Acreichthys_tomentosus'; 
metaData.species_en = 'Bristle-tail file-fish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'jiCie'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 26];

%% set data
% zero-variate data

data.am = 10 * 365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.6);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 7;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'guess'; 
  comment.Lp = 'estimate, derived from other species';
data.Li  = 14;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 9.7e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at puberty';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.57 mm of Stephanolepis_hispidus: pi/6*0.057^3';
data.Wwp = 8.3;  units.Wwp = 'g';   label.Wwp = 'wet weight at birth';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02630*Lp^2.96, see F1';
data.Wwi = 65;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02630*Li^2.96, see F1';

data.GSI = 0.15; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'KimBae2016';
  temp.GSI = C2K(28.6);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Thamnaconus modestus';
  
% univariate data
% time-length
data.tL = [ ... % time since birth (mnth), total length (cm)
4	5.929
5	6.283
7	6.991
9	7.451
11	7.770
13	7.947
12+3	9.009
12+4	9.150
12+5	9.150
12+7	9.504
12+9	9.575
12+11	10.000
12+13	10.106];
data.tL(:,1) = 30.5 * (data.tL(:,1) + 6); % convert mnth to d
units.tL   = {'d', 'cm', 'g'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PeriGeis1991'; 

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

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.02630*(TL in cm)^2.96';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '9JLY'; % Cat of Life
metaData.links.id_ITIS = '646188'; % ITIS
metaData.links.id_EoL = '46570802'; % Ency of Life
metaData.links.id_Wiki = 'Acreichthys_tomentosus'; % Wikipedia
metaData.links.id_ADW = 'Acreichthys_tomentosus'; % ADW
metaData.links.id_Taxo = '160097'; % Taxonomicon
metaData.links.id_WoRMS = '220054'; % WoRMS
metaData.links.id_fishbase = 'Acreichthys-tomentosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acreichthys_tomentosus}}';
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
bibkey = 'PeriGeis1991'; type = 'Article'; bib = [ ... 
'doi = {10.1007/BF01320240}, ' ...
'author = {Peristiwady, T. and P. Geistdoerfer}, ' ... 
'year = {1991}, ' ...
'title = {Biological aspects of \emph{Monacanthus tomentosus} ({M}onacanthidae) in the seagrass beds of {K}otania {B}ay, {W}est {S}eram, {M}oluccas, {I}ndonesia}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {109}, ' ...
'pages = {135-139}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KimBae2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s12601-016-0031-y}, ' ...
'author = {AhReum Kim and HoJin Bae and Hyeong-Gi Kim and Chul-Woong Oh}, ' ... 
'year = {2016}, ' ...
'title = {Age and growth of filefish, \emph{Thamnaconus modestus} ({G}\"{u}nther, 1877) off the {J}eju {I}sland of {K}orea}, ' ...
'journal = {Ocean Sci. J.}, ' ...
'volume = {51}, ' ...
'pages = {355–362}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{hhttp://www.fishbase.se/summary/Acreichthys-tomentosus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
