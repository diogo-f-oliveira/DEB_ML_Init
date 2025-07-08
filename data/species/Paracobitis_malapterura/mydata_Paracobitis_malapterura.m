  function [data, auxData, metaData, txtData, weights] = mydata_Paracobitis_malapterura

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Nemacheilidae';
metaData.species    = 'Paracobitis_malapterura'; 
metaData.species_en = 'Western crested loach'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFm', '0iFp'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Saeid Esmaeilpour-poodeh'};        
metaData.date_subm = [2022 04 27];                           
metaData.email    = {'esmaeilpoorsaeid@yahoo.com'};                 
metaData.address  = {'Gorgan University of Agricultural Sciences and Natural Resourses'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 02];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 02];

%% set data
% zero-variate data
data.tp = 2.5*365;      units.tp = 'd';  label.tp = 'age at puberty for females'; bibkey.tp = 'MousKama2012';
  temp.tp = C2K(18); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 1.5*365;     units.tpm = 'd';  label.tpm = 'age at puberty for males';   bibkey.tpm = 'MousKama2012';
  temp.tpm = C2K(18); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'PatiAdin2009';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = ['PatiAdin2009 report max ages of the population observed were 3+ years for males and 4+ for females; ...' ...
      'MousKama2012 report 5+ year old individuals'];

data.Lb = 0.5;  units.Lb = 'cm'; label.Lb = 'total length at birth';              bibkey.Lb = 'Robo1981'; 
data.Lp = 7.74;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'PatiAdin2009'; 
data.Lpm = 6.69;  units.Lpm = 'cm'; label.Lpm = 'total length at puberty for males'; bibkey.Lpm = 'PatiAdin2009'; 
data.Li = 13;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'PatiAdin2009';

data.Wwb = 2.7e-4;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Robo1981';
  comment.Wwb = 'Computed from egg diameter of 0.8 mm: 4/3*pi*0.04^3';
data.Wwp = 4.9;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = 'Asay2009';
  comment.Wwp = 'Bas Kooijman tWw_f data gives 11.28 g at tp';
data.Wwpm = 13.58;  units.Wwpm = 'g';  label.Wwpm = 'wet weight at puberty for males';bibkey.Wwpm = 'Asay2009';
  comment.Wwpm = 'Bas Kooijman tWw_m data gives 3.4 g at tpm';
data.Wwi = 30.55; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';                  bibkey.Wwi = 'PatiAdin2009';
 
data.Ri = 1180/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'PatiAdin2009';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.5	5.62
1.5	7.28
2.5	9.42
3.5	11.42
4.5	12.85];
data.tL_f (:,1) = (.5 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length'};  
temp.tL_f = C2K(18);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'PatiAdin2009';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.5	5.66
1.5	7.24
2.5	9.22
3.5	10.57];
data.tL_m (:,1) = (.5 + data.tL_m (:,1)) * 365; % convert yr to d
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length'};  
temp.tL_m = C2K(18);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'PatiAdin2009';
comment.tL_m = 'Data for males';
%
% time-weight
data.tWw_f = [ ... % time since birth (yr), wet weight (g)
0.5	1.96
1.5	3.65
2.5	11.28
3.5     23.22
4.5	30.02];
data.tWw_f (:,1) = (.5 + data.tWw_f (:,1)) * 365; % convert yr to d
units.tWw_f = {'d', 'g'}; label.tWw_f  = {'time since birth', 'wet weight'};  
temp.tWw_f = C2K(18);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'PatiAdin2009';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time since birth (yr), wet weight (g)
0.5	2.25
1.5	3.52
2.5     7.44
3.5	14.02];
data.tWw_m(:,1) = (.5 + data.tWw_m(:,1)) * 365; % convert yr to d
units.tWw_m = {'d', 'g'}; label.tWw_m = {'time since birth', 'wet weight'};  
temp.tWw_m = C2K(18);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'PatiAdin2009';
comment.tWw_m = 'Data for males';
%
%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Wwp = 0 * weights.Wwp;
weights.Wwpm = 0 * weights.Wwpm;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 
weights.psd.k = 5*0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Bas Kooijman: Wwp and Wwpm data is ignored, because they are probably interchanged';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = 'WK47'; % Cat of Life
metaData.links.id_ITIS = '163981'; % ITIS
metaData.links.id_EoL = '212556'; % Ency of Life
metaData.links.id_Wiki = 'Paracobitis_malapterura'; % Wikipedia
metaData.links.id_ADW = 'Paracobitis_malapterura'; % ADW
metaData.links.id_Taxo = '43977'; % Taxonomicon
metaData.links.id_WoRMS = '154373'; % WoRMS
metaData.links.id_fishbase = 'Paracobitis_malapterura'; % fishbase

%% References
bibkey = 'MousKama2012'; type = 'Article'; bib = [ ...  
'author = {Mousavi-Sabet, H. and Kamali, A. and Soltani, M. and Bani, A. and Esmaeili, HR. and Khoshbavar Rostami, H. and Vatandoust, S. and Moradkhani, Z}, ' ...
'year = {2012}, ' ...
'title = {Reproductive biology of \emph{Cobitis keyvani} ({C}obitidae) from the {T}alar {R}iver in the southern {C}aspian {S}ea basin}, ' ... 
'journal = {Iranian Journal of Fisheries Sciences      }, ' ...
'volume = {11}, '...
'pages = {383-393}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PatiAdin2009'; type = 'Article'; bib = [ ...  
'author = {Patimar, R. and Adineh, H. and Mahdavi, MJ}, ' ...
'year = {2009}, ' ...
'title = {Life history of the Western Crested Loach \emph{Paracobitis malapterura} in the {Z}arrin-{G}ol {R}iver, East of the {E}lburz mountains ({N}orthern {I}ran)}, ' ... 
'journal = {Biologia}, ' ...
'volume = {64}, '...
'pages = {350-355}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Asay2009'; type = 'Mscthesis'; bib = [ ... 
'author = {Asayesh, S}, ' ...
'year = {2009}, ' ...
'title  = {Investigation of dynamics and density parameters of \emph{Paracobitis malapterura} ({V}alenciennes, 1846) and its relationship with environmental factors in {T}ilabad and {Z}arrin {G}ol streams, {G}olestan province, {I}ran}, ' ...
'school = {Gorgan university of Agricultural Sciences and Natural Resources, Iran}, ' ...
'pages = {260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Robo1981'; type = 'Article'; bib = [ ...  
'author = {P. W. J. Robotham}, ' ...
'year = {1981}, ' ...
'title = {Age, growth and reproduction of a population of spined loach, \emph{Cobitis taenia} ({L}.)}, ' ... 
'journal = {Hydrobiologia}, ' ...
'volume = {85}, '...
'pages = {129--136}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/6378}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
