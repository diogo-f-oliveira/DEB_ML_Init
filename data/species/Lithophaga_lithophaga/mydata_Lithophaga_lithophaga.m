function [data, auxData, metaData, txtData, weights] = mydata_Lithophaga_lithophaga

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Lithophaga_lithophaga'; 
metaData.species_en = 'Date mussel'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MANE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdp'; 'Wdi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 06];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 06]; 

%% set data
% zero-variate data

data.am = 55*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'KefiBoub2014';   
  temp.am = C2K(19);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KefiBoub2014';
data.Li  = 9.5;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'PehaPulj2015';

data.Wwb = 9.7e-7;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'KefiBoub2014';
  comment.Wwb = 'based on egg diameter of 123 mum: pi/6*0.0123^3';
data.Wdp = 0.25;   units.Wdp = 'g';   label.Wdp = 'wet weight at puberty';   bibkey.Wdp = {'KefiBoub2014','PehaPulj2015'};
  comment.Wdi = 'Based on 10^(-4.780)*(10*Lp)^2.611, see F1';
data.Wdi = 2.42;  units.Wdi = 'g';   label.Wdi = 'ultimate dry weight';     bibkey.Wdi = {'KefiBoub2014','PehaPulj2015'};
  comment.Wdi = 'Based on 10^(-4.780)*(10*Li)^2.611, see F1';

data.GSI  = 0.12;   units.GSI  = '-'; label.GSI  = 'gonado somatic index'; bibkey.GSI  = 'KefiBoub2014';   
  temp.GSI = C2K(19);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), length (cm)
10.009	3.280
13.042	3.080
14.880	3.760
15.957	4.120
16.019	3.940
17.029	3.660
17.855	4.380
17.921	4.800
17.979	3.880
18.867	4.480
18.999	5.340
19.060	4.920
21.018	4.680
21.024	5.640
21.904	4.780
21.907	5.280
22.917	4.980
22.925	6.360
23.994	5.440
23.997	5.920
24.875	4.840
24.941	5.220
24.944	5.720
25.004	5.120
25.953	5.240
25.954	5.460
26.023	6.340
26.024	6.560
26.775	5.300
26.902	5.440
26.903	5.540
26.968	5.880
26.970	6.120
26.971	6.320
27.924	7.000
27.976	5.340
29.944	6.640
29.945	6.720
29.945	6.820
29.948	7.200
30.005	6.240
30.189	5.360
30.891	6.400
31.014	5.820
31.018	6.480
33.050	7.940
33.296	6.840
34.054	6.800
34.055	6.840
34.055	6.920
34.056	7.100
35.062	6.240
35.068	7.140
35.133	7.380
36.841	7.600
36.968	7.740
37.032	7.840
37.100	8.480
37.921	8.460
38.989	7.300
38.990	7.580
41.083	8.560
42.024	7.380
43.034	7.120
47.024	8.420
47.967	7.520
50.123	8.480
54.047	9.320];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d 
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PehaPulj2015';
comment.tL = 'temperature cycles seasonally between 14 and 24 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL; 
weights.GSI = 3 * weights.GSI; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.5; units.psd.k = '-'; label.psd.k = 'maintenance rate coeffcient';
weights.psd.k = 3; 
weights.psd.v = 3 * weights.psd.v; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: soft-tissue Wd in g = 10^(-4.780)*(shell length in mm)^2.611';
metaData.bibkey.F1 = 'KefiBoub2014'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VKV7'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46467081'; % Ency of Life
metaData.links.id_Wiki = 'Lithophaga_lithophaga'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '39205'; % Taxonomicon
metaData.links.id_WoRMS = '140459'; % WoRMS
metaData.links.id_molluscabase = '140459'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithophaga_lithophaga}}';
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
bibkey = 'KefiBoub2014'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s10152-014-0400-9}, ' ...
'author = {Ferdaous Jaafar Kefi and Samir Boubaker and Najoua Trigui El Menif}, ' ... 
'year = {2014}, ' ...
'title = {Relative growth and reproductive cycle of the date mussel \emph{Lithophaga lithophaga} ({L}innaeus, 1758) sampled from the {B}izerte {B}ay ({N}orthern {T}unisia)}, ' ...
'journal = {Helgol Mar Res}, ' ...
'volume = {68}, ' ...
'pages = {439-450}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PehaPulj2015'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00227-015-2690-0}, ' ...
'author = {Melita Peharda and Sanja Puljas and Laurent Chauvaud and Bernd R. Sch\"{o}ne and Daria Ezgeta-Bali\''{c} and Julien Th\''{e}bault}, ' ... 
'year = {2015}, ' ...
'title = {Growth and longevity of \emph{Lithophaga lithophaga}: what can we learn from shell structure and stable isotope composition?}, ' ...
'journal = {Mar Biol}, ' ...
'volume = {162}, ' ...
'pages = {1531-1540}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
