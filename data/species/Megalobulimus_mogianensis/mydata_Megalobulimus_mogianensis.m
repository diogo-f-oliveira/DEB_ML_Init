function [data, auxData, metaData, txtData, weights] = mydata_Megalobulimus_mogianensis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Strophocheilidae';
metaData.species    = 'Megalobulimus_mogianensis'; 
metaData.species_en = 'Snail'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTi', '0iTg'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 07];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 07]; 

%% set data
% zero-variate data

data.am = 35*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FontMira2004';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value for Megalobulimus paranaguensis';

data.Lb  = 2.44; units.Lb  = 'cm';  label.Lb  = 'length at birth'; bibkey.Lb  = 'Rome2004';
data.Lp  = 7.8; units.Lp  = 'cm';  label.Lp  = 'shell width at puberty'; bibkey.Lp  = 'Rome2004';
data.Li  = 10.05;   units.Li  = 'cm';  label.Li  = 'ultimate shell width'; bibkey.Li  = 'Rome2004';

data.Wwi = 158.5;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'Rome2004';
  comment.Wwi = 'based on 0.0009*(10*Li)^2.62, see F2; weight includes shell';

data.Ri  = 8.7/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'FontMira2004';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'value for Megalobulimus paranaguensis'; 

% uni-variate data
% time - length
data.tL = [ ... % time since birth (d), shell length (cm)
0.000	2.608
9.834	2.733
18.263	2.951
33.716	3.201
49.170	3.450
59.004	3.544
75.862	3.544
103.959	3.528
123.627	3.528
150.319	3.513
184.035	3.544
227.585	3.513
243.039	3.575
255.682	3.840
269.731	4.214
286.589	5.041
296.423	5.602
313.281	6.133
328.735	6.179
346.998	6.179
362.451	6.600
377.904	6.881
391.953	6.975
408.811	7.255
422.859	7.567
436.908	7.614
452.361	7.614
466.410	7.630
481.863	7.645
497.316	7.614
512.770	7.614
528.223	7.645
543.676	7.645
556.320	7.630
573.178	7.614
588.632	7.645
604.085	7.645
619.538	7.676
639.206	7.676
651.850	7.676
664.493	7.848
679.947	7.864
696.805	7.864
708.044	7.942
727.711	8.253
745.975	8.300
754.404	8.487
774.072	8.659
788.120	8.721
804.978	8.721
816.217	8.752
827.456	8.721
847.124	8.721
865.387	8.706
878.030	8.721
897.698	8.721
911.747	8.721
922.985	8.752
938.439	8.768
956.702	8.706
969.345	8.784
987.608	8.784
1003.062	8.784
1017.110	8.799
1031.159	8.799
1043.802	8.799
1062.065	8.846
1112.640	8.940
1114.045	9.064
1137.927	9.049
1157.595	9.049];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(21);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Rome2004';
    
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
D1 = 'Kappa_R = 0.95/2 because of hermaphroditism';
D2 = 'Temperatures in C for tL data varies in time in d as T(t)=21+6*sin(2*pi*(t-180)/365)';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'This species is hermaphroditic';
metaData.bibkey.F1 = 'FontMira2004'; 
F2 = 'length-weight: body wet weight in g = 0.0009*(shell length in mm)^2.62)';
metaData.bibkey.F2 = 'Rome2004'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '7S3JH'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '58997112'; % Ency of Life
metaData.links.id_Wiki = 'Megalobulimus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '134500'; % Taxonomicon
metaData.links.id_WoRMS = '1419728'; % WoRMS
metaData.links.id_molluscabase = '1419728'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Megalobulimus}}';
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
bibkey = 'Rome2004'; type = 'Article'; bib = [ ... 
'author = {Sonia Maria Brazil Romero}, ' ... 
'year = {2004}, ' ...
'title = {Growth of \emph{Megalobulimus mogianensis} ({G}astropoda: {M}egalobulimidae) raised in the laboratory from hatching to adulthood}, ' ...
'journal = {American Malacological Bulletin}, ' ...
'volume = {18}, ' ...
'pages = {79-84}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FontMira2004'; type = 'Article'; bib = [ ... 
'doi = {10.1590/1678-4766e2017004}, ' ...
'author = {Jos\''{e} H. Fontenelle and Marcel S. Miranda}, ' ... 
'year = {2004}, ' ...
'title = {Aspects of biology of \emph{Megalobulimus paranaguensis} ({G}astropoda, {A}cavoidea) in the coastal plain of the {B}razilian southeast}, ' ...
'journal = {Iheringia, Serie zoologia}, ' ...
'pages = {e-ISSN 1678-4766}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

