function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_trachurus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_trachurus'; 
metaData.species_en = 'Jack mackerel'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'T-ah'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Tessa van der Hammen';'Bas Kooijman'};    
metaData.date_subm = [2011 11 12];              
metaData.email    = {'tessa.vanderhammen@wur.nl'};            
metaData.address  = {'IMARES, IJmuiden'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 09 25];


%% set data
% zero-variate data

data.ah = 110.78/24;  units.ah = 'd';    label.ah = 'age at hatch';              bibkey.ah = 'PipeWalk1987';   
  temp.ah = C2K(12.5);units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.tb = 5.5;        units.tb = 'd';    label.tb = 'sime since hatch at birth'; bibkey.tb = 'KingTool1977';   
  temp.tb = C2K(12.5);units.temp.tb = 'K'; label.temp.tb = 'temperature';
data.ap = 365;        units.ap = 'd';    label.ap = 'age at puberty';            bibkey.ap = 'AbauGord2003';
  temp.ap = C2K(15);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'higher values have also been found; this is for North Sea';
data.am = 40 * 365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'AbauGord2003'; 
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lh  = 0.246;     units.Lh  = 'cm';  label.Lh  = 'total length at hatch';    bibkey.Lh  = 'PipeWalk1987';  
data.Lb  = 0.4;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'guess';  
data.Lp  = 21.9;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'AbauGord2003'; 
  comment.Lp = 'for females';
data.Li  = 53;        units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'frisbe';

data.Wwb = 0.001;     units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
data.Wwp = 91;        units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'frisbe';
data.Wwi = 1178;      units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'frisbe';

data.Ri  = 1.4e5/ 365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'frisbe';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% T-ah data
data.Tah = [ ... % temperature (C), time to 50% hatching (h)    
10.42	156.25
12.27	110.78
14.10	 84.95
15.84    69.44
17.53    55.09
19.33    44.92
21.15    41.00];
data.Tah(:,2) = data.Tah(:,2)/ 24; % convert h to d
units.Tah   = {'C', 'd'}; label.Tah = {'temperature', 'age at hatch'};  
bibkey.Tah = 'PipeWalk1987';
  
% t-L data from IMARES database (frisbe): T = 273+15 (northsea), f=? (northsea)
data.tL = [365 * [1:22,25,26,28,29,30,31,32,33,34,36,39]; % d, time since birth in days
18.1,21.4,24.8,26.4,27.4,27.8,29.6,28.2,29.9,30.2,31,30.8,33.4,32,33.4,32.3,34.2,33.8,34.7,32.9,33.6,31.5,35.9,39.7,33.2,34.2,35.8,35,35.4,34.5,38.5,32.5,33.5]'; %cm, physical length
units.tL   = {'d', 'g'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'frisbe';

% L-W data
data.LW = [ ...
11	10
12	11
14	23.14
15	28.59
16	33.71
17	38.59
18	46.47
19	57.43
20	68.03
21	77.8
22	91.12
23	103.89
24	115.79
25	129.69
26	143.66
27	158.9
28	175.76
29	193.35
30	212.27
31	235.81
32	258.97
33	286.04
34	311.45
35	336.29
36	365.2
37	400.44
38	426.21
39	462.05
40	522.5
41	513.6
42	567.67];
units.LW = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'frisbe';

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

%% Links
metaData.links.id_CoL = '57PL7'; % Cat of Life
metaData.links.id_ITIS = '168588'; % ITIS
metaData.links.id_EoL = '46578054'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_trachurus'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_trachurus'; % ADW
metaData.links.id_Taxo = '45255'; % Taxonomicon
metaData.links.id_WoRMS = '126822'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-trachurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_trachurus}}';
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
bibkey = 'AbauGord2003'; type = 'Article'; bib = [ ... 
'author = {Abaunza, P. and L. Gordo and C. Karlou-Riga and A. Murta and A. T. G. W.  Eltink and M. T. Garcia Santamaria and C. Zimmermann and C. Hammer and P. Lucio and S. A. Iversen and J. Molloy and E. Gallo}, ' ... 
'year = {2003}, ' ...
'title = {Growth and reproduction of horse mackerel, \emph{Trachurus trachurus} ({C}arangidae)}, ' ...
'journal = {Reviews in fish biology and fisheries}, ' ...
'volume = {13}, ' ...
'pages = {27--61}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mace1974'; type = 'Article'; bib = [ ... 
'author = {Macer, C. T.}, ' ... 
'year = {1974}, ' ...
'title = {REPRODUCTIVE BIOLOGY OF HORSE MACKEREL \emph{Trachurus trachurus} ({L}) IN {N}ORTH-{S}EA AND {E}NGLISH-{C}HANNEL}, ' ...
'journal = {JOURNAL OF FISH BIOLOGY}, ' ...
'volume = {6}, ' ...
'pages = {415--438}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PipeWalk1987'; type = 'Article'; bib = [ ... 
'author = {Pipe, R. K. and Walker, P.}, ' ... 
'year = {1987}, ' ...
'title = {The effect of temperature on development and hatching of scad, \emph{Trachurus trachurus} {L}., eggs}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {31}, ' ...
'pages = {675--682}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KingTool1977'; type = 'Article'; bib = [ ... 
'author = {King, D. P. F. and OToole, M. J. and Robertson, A. A. }, ' ... 
'year = {1977}, ' ...
'title = {Early Development of the {S}outh {A}frican {M}aasbanker \emph{Trachurus trachurus} at Controlled Temperatures.}, ' ...
'journal = {Fisheries Bulletin of South Africa}, ' ...
'volume = {9}, ' ...
'pages = {16--22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'frisbe'; type = 'misc'; bib = [ ... 
'note = {IMARES data base}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

