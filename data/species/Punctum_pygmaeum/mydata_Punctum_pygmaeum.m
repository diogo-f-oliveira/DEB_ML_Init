function [data, auxData, metaData, txtData, weights] = mydata_Punctum_pygmaeum
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Punctidae';
metaData.species    = 'Punctum_pygmaeum'; 
metaData.species_en = 'Dwarf snail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biH'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wdi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 18]; 

%% set data
% zero-variate data

data.tp  = 66;   units.tp  = 'd'; label.tp  = 'time since birth at puberty';     bibkey.tp  = 'Baur1989';   
  temp.tp = C2K(21.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am  = 200;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'Baur1989';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.05; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'Baur1989';
data.Lp  = 0.135; units.Lp  = 'cm';  label.Lp  = 'shell breath at puberty';   bibkey.Lp  = 'Baur1989';
data.Li  = 0.16; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'Baur1989';

data.Wdi  = 7.69e-5; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Will1976';
  comment.Wdi = 'based on size-corrected value for Cepaea nemoralis: (0.16/2.2)^3*0.2';

data.Ni  = 6;   units.Ni  = '#'; label.Ni  = 'life time reproduction output';     bibkey.Ni  = 'Baur1989';   
  temp.Ni = C2K(21.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), shell height (cm)
1.017	0.053
4.746	0.065
7.119	0.058
8.136	0.074
9.831	0.067
13.220	0.075
14.237	0.094
15.254	0.084
20.000	0.108
20.678	0.097
25.085	0.110
28.475	0.105
30.169	0.126
35.254	0.118
35.932	0.126
38.983	0.125
43.390	0.129
43.729	0.121
44.746	0.132
48.136	0.125
56.610	0.134
58.983	0.131
60.339	0.136
62.034	0.134
62.373	0.131
63.729	0.142
66.441	0.138
70.508	0.137
74.915	0.138
81.017	0.144
82.712	0.141
89.492	0.144
90.508	0.147
96.271	0.150
96.271	0.147
101.695	0.151
105.085	0.149
110.508	0.152
113.220	0.150
116.610	0.154
121.017	0.159
121.356	0.152
122.034	0.155
157.627	0.152
184.068	0.160
200.339	0.154];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Baur1989';
comment.tL = 'Data does not include 2 individuls with less growth';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Simultaneous hermaprodite; known as ovoviviparous, but does lay eggs in lab with well-developed embryos';
metaData.bibkey.F1 = 'Baur1989'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4QHSP'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4920268'; % Ency of Life
metaData.links.id_Wiki = 'Punctum_pygmaeum'; % Wikipedia
metaData.links.id_ADW = ''; % ADW  not present 
metaData.links.id_Taxo = '38724'; % Taxonomicon 
metaData.links.id_WoRMS = '1050603'; % WoRMS
metaData.links.id_molluscabase = '1050603'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Punctum_pygmaeum}}';
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
bibkey = 'Baur1989'; type = 'Article'; bib = [ ... 
'doi = {10.1093/mollus/55.3.383 }, ' ...
'author = {Bruno Baur}, ' ... 
'title = {Growth and reproduction of the minute land snail \emph{Punctum pygmaeum} ({D}raparnaud)}, ' ...
'journal = {J. Moll. Stud.}, ' ...
'volume = {55}, ' ...
'year = {1989}, ' ...
'pages = {383-387}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Will1976'; type = 'Article'; bib = [ ... 
'author = {Phillip Williampson}, ' ... 
'title = {Size-weight relationships and field growth rates of the landsnail \emph{Cepaea nemoralis} {L}.}, ' ...
'journal = {Journal of Animal Ecology}, ' ...
'number = {3}, ' ...
'volume = {45}, ' ...
'year = {1976}, ' ...
'pages = {875-885}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

